	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080772B8
sub_080772B8: @ 0x080772B8
	push {r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r2, _080772F8 @ =gUnknown_08615194
	ldr r0, _080772FC @ =gUnknown_0202FDFC
	ldr r1, [r0, #0xc]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	adds r0, r0, r2
	movs r1, #0
	ldrsh r0, [r0, r1]
	ldr r1, _08077300 @ =gUnknown_086145C8
	mov r2, sp
	bl sub_080733C8
	movs r5, #0
	adds r4, #0x96
_080772DC:
	mov r1, sp
	adds r0, r1, r5
	ldrb r1, [r0]
	adds r0, r4, #0
	bl sub_0807728C
	adds r4, #6
	adds r5, #1
	cmp r5, #4
	ble _080772DC
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080772F8: .4byte gUnknown_08615194
_080772FC: .4byte gUnknown_0202FDFC
_08077300: .4byte gUnknown_086145C8

