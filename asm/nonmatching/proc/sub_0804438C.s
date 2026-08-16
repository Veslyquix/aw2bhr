	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804438C
sub_0804438C: @ 0x0804438C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl sub_08044354
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_080440A8
	ldr r0, _080443C0 @ =gUnknown_08499598
	ldr r1, [r0]
	lsls r0, r4, #4
	subs r0, r0, r4
	lsls r0, r0, #2
	adds r0, r0, r1
	adds r0, #0x24
	movs r1, #0
	strb r1, [r0]
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_08039634
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080443C0: .4byte gUnknown_08499598

