	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08003DC4
sub_08003DC4: @ 0x08003DC4
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	cmp r2, #3
	beq _08003EC0
	cmp r2, #3
	bgt _08003DD8
	cmp r2, #1
	beq _08003E48
	b _08003EC8
_08003DD8:
	cmp r2, #7
	bne _08003EC8
	ldr r1, _08003E3C @ =gUnknown_0808D794
	ldr r0, [r1]
	ldr r2, [r0]
	ldrh r0, [r2]
	subs r0, #1
	adds r6, r1, #0
	cmp r4, r0
	bge _08003E12
	lsls r1, r5, #1
	ldr r3, _08003E40 @ =0x0000417A
	adds r0, r2, r3
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r1, #1
	adds r1, r1, r4
	ldr r3, _08003E44 @ =0x00001432
	adds r0, r2, r3
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #1
	beq _08003E0A
	cmp r0, #0xd
	bne _08003E12
_08003E0A:
	adds r0, r4, #1
	adds r1, r5, #0
	bl sub_08007F9C
_08003E12:
	cmp r4, #0
	ble _08003EC8
	ldr r0, [r6]
	ldr r1, [r0]
	lsls r2, r5, #1
	ldr r3, _08003E40 @ =0x0000417A
	adds r0, r1, r3
	adds r0, r0, r2
	ldrh r0, [r0]
	subs r0, #1
	adds r0, r0, r4
	ldr r2, _08003E44 @ =0x00001432
	adds r1, r1, r2
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #1
	beq _08003E38
	cmp r0, #0xd
	bne _08003EC8
_08003E38:
	subs r0, r4, #1
	b _08003EAA
	.align 2, 0
_08003E3C: .4byte gUnknown_0808D794
_08003E40: .4byte 0x0000417A
_08003E44: .4byte 0x00001432
_08003E48:
	ands r2, r4
	cmp r2, #0
	beq _08003EC8
	ldr r6, _08003EB4 @ =gUnknown_0808D794
	cmp r5, #0
	ble _08003E7E
	ldr r0, [r6]
	ldr r2, [r0]
	subs r1, r5, #1
	lsls r1, r1, #1
	ldr r3, _08003EB8 @ =0x0000417A
	adds r0, r2, r3
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r0, r0, r4
	ldr r1, _08003EBC @ =0x00001432
	adds r2, r2, r1
	adds r2, r2, r0
	ldrb r0, [r2]
	cmp r0, #7
	beq _08003E76
	cmp r0, #0xd
	bne _08003E7E
_08003E76:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_08007F9C
_08003E7E:
	ldr r0, [r6]
	ldr r2, [r0]
	ldrh r0, [r2, #2]
	subs r0, #1
	cmp r5, r0
	bge _08003EC8
	adds r1, r5, #1
	lsls r1, r1, #1
	ldr r3, _08003EB8 @ =0x0000417A
	adds r0, r2, r3
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r1, r1, r4
	ldr r3, _08003EBC @ =0x00001432
	adds r0, r2, r3
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #7
	beq _08003EA8
	cmp r0, #0xd
	bne _08003EC8
_08003EA8:
	adds r0, r4, #0
_08003EAA:
	adds r1, r5, #0
	bl sub_08007F9C
	b _08003EC8
	.align 2, 0
_08003EB4: .4byte gUnknown_0808D794
_08003EB8: .4byte 0x0000417A
_08003EBC: .4byte 0x00001432
_08003EC0:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0800AF74
_08003EC8:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

