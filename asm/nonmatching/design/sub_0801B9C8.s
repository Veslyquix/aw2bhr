	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801B9C8
sub_0801B9C8: @ 0x0801B9C8
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r5, r1, #0
	adds r4, r2, #0
	adds r1, r3, #0
	ldr r6, _0801BA0C @ =gUnknown_03002B80
	adds r0, r5, #0
	bl sub_0801B7C0
	adds r2, r0, #0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	beq _0801BA14
	lsls r2, r2, #2
	adds r2, r2, r6
	movs r1, #0x96
	lsls r1, r1, #2
	adds r0, r2, r1
	ldrh r1, [r0]
	adds r1, r1, r4
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r0, _0801BA10 @ =0x0000025A
	adds r2, r2, r0
	ldrb r2, [r2]
	adds r0, r7, #0
	bl sub_0801BA1C
	adds r0, r5, #0
	bl sub_0808B6B0
	b _0801BA16
	.align 2, 0
_0801BA0C: .4byte gUnknown_03002B80
_0801BA10: .4byte 0x0000025A
_0801BA14:
	movs r0, #0
_0801BA16:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

