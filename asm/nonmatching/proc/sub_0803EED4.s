	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803EED4
sub_0803EED4: @ 0x0803EED4
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r6, _0803EF38 @ =gUnknown_08499590
	ldr r3, [r6]
	lsls r4, r1, #1
	ldr r5, _0803EF3C @ =0x0000417A
	adds r2, r3, r5
	adds r2, r2, r4
	ldrh r2, [r2]
	adds r2, r2, r0
	ldr r4, _0803EF40 @ =0x00001432
	adds r3, r3, r4
	adds r3, r3, r2
	ldrb r4, [r3]
	bl sub_0803DE94
	adds r5, r0, #0
	cmp r5, #0
	beq _0803EF2C
	ldrh r0, [r5, #2]
	lsls r0, r0, #0x16
	lsrs r0, r0, #0x1c
	mov r4, sp
	mov r1, sp
	bl sub_0803DF98
	ldr r3, [r6]
	ldrb r0, [r5, #1]
	ldrh r1, [r4, #2]
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, _0803EF3C @ =0x0000417A
	adds r2, r3, r1
	adds r2, r2, r0
	ldrb r0, [r5]
	mov r1, sp
	ldrh r1, [r1]
	adds r0, r0, r1
	ldrh r2, [r2]
	adds r0, r0, r2
	ldr r4, _0803EF40 @ =0x00001432
	adds r3, r3, r4
	adds r3, r3, r0
	ldrb r4, [r3]
_0803EF2C:
	adds r0, r4, #0
	add sp, #4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0803EF38: .4byte gUnknown_08499590
_0803EF3C: .4byte 0x0000417A
_0803EF40: .4byte 0x00001432

