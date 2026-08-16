	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803CCB8
sub_0803CCB8: @ 0x0803CCB8
	push {r4, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r3, _0803CCE0 @ =gUnknown_020280C0
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r2, r1, #2
	adds r0, r2, r3
	ldrb r0, [r0, #0x13]
	cmp r0, #0xff
	beq _0803CCE4
	adds r1, r3, #2
	adds r1, r2, r1
	adds r0, r4, #0
	bl sub_0803CC84
	movs r0, #1
	b _0803CCE6
	.align 2, 0
_0803CCE0: .4byte gUnknown_020280C0
_0803CCE4:
	movs r0, #0
_0803CCE6:
	pop {r4}
	pop {r1}
	bx r1

