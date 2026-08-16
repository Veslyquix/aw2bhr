	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08057FA8
sub_08057FA8: @ 0x08057FA8
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
	ldr r0, _08057FE0 @ =gUnknown_03003F2C
	ldrh r2, [r0]
	adds r3, r2, #0
	adds r3, #0x40
	cmp r2, r3
	bge _08057FD8
	ldr r0, _08057FE4 @ =gUnknown_08499594
	ldr r1, [r0]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r1, r0, r1
	subs r2, r3, r2
_08057FC8:
	ldrb r0, [r1]
	cmp r0, r5
	bne _08057FD0
	adds r4, #1
_08057FD0:
	adds r1, #0xc
	subs r2, #1
	cmp r2, #0
	bne _08057FC8
_08057FD8:
	adds r0, r4, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08057FE0: .4byte gUnknown_03003F2C
_08057FE4: .4byte gUnknown_08499594

