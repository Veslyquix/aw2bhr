	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801A1D8
sub_0801A1D8: @ 0x0801A1D8
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	lsls r2, r2, #0x10
	lsrs r7, r2, #0x10
	lsls r3, r3, #0x1c
	lsrs r6, r3, #0x10
	cmp r4, #0x1f
	bhi _0801A1F4
	ldr r0, _0801A234 @ =0x00000361
	adds r1, r0, #0
	adds r0, r6, #0
	orrs r0, r1
	strh r0, [r5]
_0801A1F4:
	adds r5, #2
	adds r4, #1
	movs r2, #0
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	subs r3, r0, #2
	cmp r2, r3
	bge _0801A220
	ldr r1, _0801A238 @ =0x00000362
	adds r0, r1, #0
	adds r1, r6, #0
	orrs r1, r0
_0801A20C:
	cmp r4, #0x1f
	bhi _0801A212
	strh r1, [r5]
_0801A212:
	adds r5, #2
	adds r4, #1
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, r3
	blt _0801A20C
_0801A220:
	cmp r4, #0x1f
	bhi _0801A22E
	ldr r0, _0801A23C @ =0x00000363
	adds r1, r0, #0
	adds r0, r6, #0
	orrs r0, r1
	strh r0, [r5]
_0801A22E:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801A234: .4byte 0x00000361
_0801A238: .4byte 0x00000362
_0801A23C: .4byte 0x00000363

