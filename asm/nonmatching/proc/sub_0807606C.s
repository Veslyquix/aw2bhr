	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0807606C
sub_0807606C: @ 0x0807606C
	push {lr}
	adds r0, #0x3a
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r2, #0x11
	cmp r0, #0
	bge _0807607E
	movs r2, #0
_0807607E:
	ldr r0, _080760AC @ =gUnknown_08551A00
	ldr r0, [r0]
	movs r1, #0xa0
	lsls r1, r1, #2
	adds r0, r0, r1
	ldr r3, _080760B0 @ =gUnknown_08499578
	lsls r2, r2, #1
	movs r1, #0x80
	lsls r1, r1, #3
	adds r2, r2, r1
	ldr r1, [r3]
	adds r1, r1, r2
	movs r2, #0xd
	movs r3, #4
	bl sub_08071900
	bl sub_08013AEC
	bl sub_08013B0C
	pop {r0}
	bx r0
	.align 2, 0
_080760AC: .4byte gUnknown_08551A00
_080760B0: .4byte gUnknown_08499578

