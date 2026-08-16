	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08045C18
sub_08045C18: @ 0x08045C18
	push {r4, lr}
	ldr r0, _08045CD0 @ =gUnknown_08499590
	ldr r4, [r0]
	ldr r1, _08045CD4 @ =0x0000417A
	adds r0, r4, r1
	ldrh r0, [r0]
	mov ip, r0
	adds r0, #0x15
	ldr r1, _08045CD8 @ =0x00001432
	adds r3, r4, r1
	adds r0, r3, r0
	ldrb r0, [r0]
	movs r2, #0xe0
	lsrs r0, r0, #5
	cmp r0, #2
	bne _08045CE0
	mov r0, ip
	adds r0, #0x16
	adds r0, r3, r0
	ldrb r1, [r0]
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0x40
	bne _08045CE0
	mov r0, ip
	adds r0, #0x17
	adds r0, r3, r0
	ldrb r1, [r0]
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0x40
	bne _08045CE0
	mov r0, ip
	adds r0, #0x18
	adds r0, r3, r0
	ldrb r1, [r0]
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0x40
	bne _08045CE0
	mov r0, ip
	adds r0, #0x19
	adds r0, r3, r0
	ldrb r1, [r0]
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0x40
	bne _08045CE0
	ldr r1, _08045CDC @ =0x0000417E
	adds r0, r4, r1
	ldrh r0, [r0]
	mov ip, r0
	adds r0, #0x15
	adds r0, r3, r0
	ldrb r1, [r0]
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0x40
	bne _08045CE0
	mov r0, ip
	adds r0, #0x16
	adds r0, r3, r0
	ldrb r1, [r0]
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0x40
	bne _08045CE0
	mov r0, ip
	adds r0, #0x17
	adds r0, r3, r0
	ldrb r1, [r0]
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0x40
	bne _08045CE0
	mov r0, ip
	adds r0, #0x18
	adds r0, r3, r0
	ldrb r1, [r0]
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0x40
	bne _08045CE0
	mov r0, ip
	adds r0, #0x19
	adds r0, r3, r0
	ldrb r0, [r0]
	ands r2, r0
	cmp r2, #0x40
	bne _08045CE0
	movs r0, #1
	b _08045CE2
	.align 2, 0
_08045CD0: .4byte gUnknown_08499590
_08045CD4: .4byte 0x0000417A
_08045CD8: .4byte 0x00001432
_08045CDC: .4byte 0x0000417E
_08045CE0:
	movs r0, #0
_08045CE2:
	pop {r4}
	pop {r1}
	bx r1

