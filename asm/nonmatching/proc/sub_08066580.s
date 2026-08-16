	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08066580
sub_08066580: @ 0x08066580
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r0, _080665B4 @ =gUnknown_08580D0C
	movs r1, #1
	bl sub_080152EC
	strh r5, [r0, #0x28]
	strh r6, [r0, #0x2a]
	strh r4, [r0, #0x1c]
	ldr r1, _080665B8 @ =gUnknown_08580934
	ldr r2, [r1]
	lsls r3, r4, #2
	adds r1, r2, #0
	adds r1, #0x74
	adds r1, r1, r3
	str r0, [r1]
	adds r2, #0x70
	adds r2, r2, r4
	movs r0, #0xff
	strb r0, [r2]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080665B4: .4byte gUnknown_08580D0C
_080665B8: .4byte gUnknown_08580934

