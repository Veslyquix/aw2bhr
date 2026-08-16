	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080767C0
sub_080767C0: @ 0x080767C0
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r0, #0
	bl sub_0803866C
	adds r4, r0, #0
	cmp r4, #0
	beq _080767F4
	ldr r0, _080767EC @ =gUnknown_08614538
	ldr r1, _080767F0 @ =gUnknown_02010C50
	movs r2, #0x80
	lsls r2, r2, #2
	movs r3, #0x10
	str r3, [sp]
	movs r3, #0
	str r3, [sp, #4]
	str r5, [sp, #8]
	movs r3, #0xe
	bl sub_08073304
	b _0807680A
	.align 2, 0
_080767EC: .4byte gUnknown_08614538
_080767F0: .4byte gUnknown_02010C50
_080767F4:
	ldr r0, _08076814 @ =gUnknown_0861452C
	ldr r1, _08076818 @ =gUnknown_02010C50
	movs r2, #0x80
	lsls r2, r2, #2
	movs r3, #0x10
	str r3, [sp]
	str r4, [sp, #4]
	str r5, [sp, #8]
	movs r3, #0xe
	bl sub_08073304
_0807680A:
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08076814: .4byte gUnknown_0861452C
_08076818: .4byte gUnknown_02010C50

