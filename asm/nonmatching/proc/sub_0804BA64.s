	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804BA64
sub_0804BA64: @ 0x0804BA64
	push {r4, r5, lr}
	sub sp, #4
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	ldr r1, _0804BA94 @ =gUnknown_0813603C
	mov r0, sp
	movs r2, #4
	bl sub_0808B6E8
	cmp r5, #1
	beq _0804BA9C
	cmp r5, #2
	bne _0804BAAE
	ldr r0, _0804BA98 @ =gUnknown_02029690
	lsls r1, r4, #4
	adds r1, r1, r0
	lsls r0, r4, #1
	add r0, sp
	ldrh r0, [r0]
	strh r0, [r1, #0xa]
	strh r5, [r1]
	b _0804BAAE
	.align 2, 0
_0804BA94: .4byte gUnknown_0813603C
_0804BA98: .4byte gUnknown_02029690
_0804BA9C:
	ldr r0, _0804BAB8 @ =gUnknown_02029690
	lsls r1, r4, #4
	adds r1, r1, r0
	lsls r0, r4, #1
	add r0, sp
	ldrh r0, [r0]
	strh r0, [r1, #0xa]
	movs r0, #2
	strh r0, [r1]
_0804BAAE:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804BAB8: .4byte gUnknown_02029690

