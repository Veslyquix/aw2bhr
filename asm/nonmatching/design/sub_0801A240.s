	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801A240
sub_0801A240: @ 0x0801A240
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r0, [sp, #0x14]
	lsls r2, r2, #0x10
	lsrs r6, r2, #0x10
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov ip, r3
	lsls r0, r0, #0x1c
	lsrs r7, r0, #0x10
	cmp r4, #0x1f
	bhi _0801A26A
	ldr r1, _0801A2D4 @ =gUnknown_0848A46C
	lsls r0, r3, #0x10
	asrs r0, r0, #0xf
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r0, r7, #0
	orrs r0, r1
	strh r0, [r5]
_0801A26A:
	adds r5, #2
	adds r4, #1
	movs r2, #0
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	subs r3, r0, #3
	cmp r2, r3
	bge _0801A29E
	ldr r1, _0801A2D8 @ =gUnknown_0848A470
	mov r6, ip
	lsls r0, r6, #0x10
	asrs r0, r0, #0xf
	adds r6, r0, r1
_0801A284:
	cmp r4, #0x1f
	bhi _0801A290
	ldrh r1, [r6]
	adds r0, r7, #0
	orrs r0, r1
	strh r0, [r5]
_0801A290:
	adds r5, #2
	adds r4, #1
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, r3
	blt _0801A284
_0801A29E:
	cmp r4, #0x1f
	bhi _0801A2B4
	ldr r1, _0801A2DC @ =gUnknown_0848A474
	mov r2, ip
	lsls r0, r2, #0x10
	asrs r0, r0, #0xf
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r0, r7, #0
	orrs r0, r1
	strh r0, [r5]
_0801A2B4:
	adds r5, #2
	adds r4, #1
	cmp r4, #0x1f
	bhi _0801A2CE
	ldr r1, _0801A2E0 @ =gUnknown_0848A478
	mov r6, ip
	lsls r0, r6, #0x10
	asrs r0, r0, #0xf
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r0, r7, #0
	orrs r0, r1
	strh r0, [r5]
_0801A2CE:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801A2D4: .4byte gUnknown_0848A46C
_0801A2D8: .4byte gUnknown_0848A470
_0801A2DC: .4byte gUnknown_0848A474
_0801A2E0: .4byte gUnknown_0848A478

