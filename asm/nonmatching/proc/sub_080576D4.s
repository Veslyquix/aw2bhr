	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080576D4
sub_080576D4: @ 0x080576D4
	push {r4, r5, lr}
	lsls r3, r1, #3
	subs r3, r3, r1
	lsls r3, r3, #2
	ldr r4, _08057720 @ =gUnknown_08553A1C
	adds r3, r3, r4
	movs r4, #0
	ldrsb r4, [r3, r4]
	ldrh r5, [r2]
	adds r4, r4, r5
	ldrb r3, [r3, #1]
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	ldrh r2, [r2, #2]
	adds r3, r3, r2
	lsls r3, r3, #5
	adds r4, r4, r3
	lsls r4, r4, #1
	adds r0, r0, r4
	ldr r3, _08057724 @ =gUnknown_08553AC0
	lsls r2, r1, #2
	adds r2, r2, r3
	ldr r4, [r2]
	ldr r3, _08057728 @ =gUnknown_08562124
	movs r2, #1
	ands r2, r1
	lsls r2, r2, #1
	adds r2, r2, r3
	ldrh r2, [r2]
	lsls r2, r2, #0x1c
	lsrs r2, r2, #0x10
	adds r1, r4, #0
	bl sub_080718F8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08057720: .4byte gUnknown_08553A1C
_08057724: .4byte gUnknown_08553AC0
_08057728: .4byte gUnknown_08562124

