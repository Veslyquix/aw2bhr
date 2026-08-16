	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08045FC8
sub_08045FC8: @ 0x08045FC8
	push {r4, lr}
	sub sp, #4
	movs r4, #1
	b _08045FFA
_08045FD0:
	ldr r0, _0804602C @ =gUnknown_08499598
	ldr r1, [r0]
	lsls r0, r4, #4
	subs r0, r0, r4
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r1, [r0, #0x14]
	cmp r1, #0
	bne _08045FF4
	ldrb r0, [r0, #0x1a]
	adds r0, #0x3d
	lsls r2, r4, #4
	adds r2, #0x30
	str r1, [sp]
	movs r1, #8
	movs r3, #0
	bl sub_0801F34C
_08045FF4:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
_08045FFA:
	bl sub_080248F8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r4, r0
	bls _08045FD0
	movs r4, #0
	str r4, [sp]
	movs r0, #2
	movs r1, #8
	movs r2, #0x10
	movs r3, #0
	bl sub_0801F34C
	str r4, [sp]
	movs r0, #0xa9
	movs r1, #0x5f
	movs r2, #0x30
	movs r3, #0
	bl sub_0801F34C
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804602C: .4byte gUnknown_08499598

