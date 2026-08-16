	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08059E00
sub_08059E00: @ 0x08059E00
	push {r4, lr}
	sub sp, #0xc
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r1, _08059E28 @ =gUnknown_0816D96C
	mov r0, sp
	movs r2, #0xa
	bl sub_0808B6E8
	movs r1, #0
_08059E14:
	lsls r0, r1, #1
	add r0, sp
	ldrh r0, [r0]
	cmp r4, r0
	bls _08059E2C
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	b _08059E14
	.align 2, 0
_08059E28: .4byte gUnknown_0816D96C
_08059E2C:
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	add sp, #0xc
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

