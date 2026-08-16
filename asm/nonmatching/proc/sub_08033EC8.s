	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08033EC8
sub_08033EC8: @ 0x08033EC8
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x37
	movs r0, #0
	strb r0, [r1]
	movs r4, #0
	ldr r7, _08033F14 @ =gUnknown_08090D7C
	ldr r6, _08033F18 @ =gUnknown_0849BC30
_08033EDC:
	adds r0, r5, #0
	adds r0, #0x30
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r6
	ldr r3, [r0]
	ldr r1, [r7]
	lsls r0, r4, #1
	adds r0, r0, r1
	ldrb r2, [r0]
	lsls r0, r4, #2
	adds r0, r0, r3
	ldr r3, [r0]
	adds r4, #1
	lsls r0, r4, #0xc
	str r0, [sp]
	movs r0, #0
	movs r1, #0x60
	bl sub_0801BEFC
	cmp r4, #2
	ble _08033EDC
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08033F14: .4byte gUnknown_08090D7C
_08033F18: .4byte gUnknown_0849BC30

