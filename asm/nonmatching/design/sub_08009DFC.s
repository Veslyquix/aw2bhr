	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08009DFC
sub_08009DFC: @ 0x08009DFC
	push {r4, r5, r6, r7, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	ldr r2, _08009E30 @ =gUnknown_0808D82C
	ldr r0, [r2]
	ldr r1, [r0]
	lsls r0, r4, #1
	ldr r5, _08009E34 @ =0x0000417A
	adds r6, r1, r5
	adds r0, r6, r0
	ldrh r0, [r0]
	adds r0, r0, r3
	ldr r5, _08009E38 @ =0x00001432
	adds r1, r1, r5
	adds r0, r1, r0
	ldrb r0, [r0]
	adds r7, r2, #0
	cmp r0, #7
	beq _08009E2A
	cmp r0, #0xd
	beq _08009E2A
	cmp r0, #2
	bne _08009E3C
_08009E2A:
	movs r0, #1
	rsbs r0, r0, #0
	b _08009F00
	.align 2, 0
_08009E30: .4byte gUnknown_0808D82C
_08009E34: .4byte 0x0000417A
_08009E38: .4byte 0x00001432
_08009E3C:
	movs r5, #0
	cmp r4, #0
	ble _08009E5E
	subs r0, r4, #1
	lsls r0, r0, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	adds r0, r0, r3
	adds r0, r1, r0
	ldrb r0, [r0]
	cmp r0, #7
	beq _08009E5C
	cmp r0, #0xd
	beq _08009E5C
	cmp r0, #2
	bne _08009E5E
_08009E5C:
	adds r5, #1
_08009E5E:
	ldr r0, [r7]
	ldr r2, [r0]
	ldrh r0, [r2, #2]
	subs r0, #1
	cmp r4, r0
	bge _08009E8E
	adds r1, r4, #1
	lsls r1, r1, #1
	ldr r6, _08009F08 @ =0x0000417A
	adds r0, r2, r6
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r1, r1, r3
	ldr r6, _08009F0C @ =0x00001432
	adds r0, r2, r6
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #7
	beq _08009E8C
	cmp r0, #0xd
	beq _08009E8C
	cmp r0, #2
	bne _08009E8E
_08009E8C:
	adds r5, #1
_08009E8E:
	cmp r3, #0
	ble _08009EBA
	ldr r0, [r7]
	ldr r1, [r0]
	lsls r2, r4, #1
	ldr r6, _08009F08 @ =0x0000417A
	adds r0, r1, r6
	adds r0, r0, r2
	ldrh r0, [r0]
	subs r0, #1
	adds r0, r0, r3
	ldr r2, _08009F0C @ =0x00001432
	adds r1, r1, r2
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #7
	beq _08009EB8
	cmp r0, #0xd
	beq _08009EB8
	cmp r0, #2
	bne _08009EBA
_08009EB8:
	adds r5, #1
_08009EBA:
	ldr r0, [r7]
	ldr r2, [r0]
	ldrh r0, [r2]
	subs r0, #1
	cmp r3, r0
	bge _08009EEA
	lsls r1, r4, #1
	ldr r6, _08009F08 @ =0x0000417A
	adds r0, r2, r6
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r1, #1
	adds r1, r1, r3
	ldr r6, _08009F0C @ =0x00001432
	adds r0, r2, r6
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #7
	beq _08009EE8
	cmp r0, #0xd
	beq _08009EE8
	cmp r0, #2
	bne _08009EEA
_08009EE8:
	adds r5, #1
_08009EEA:
	cmp r5, #4
	bne _08009EFE
	adds r0, r3, #0
	adds r1, r4, #0
	bl sub_080094EC
	cmp r0, #0
	bne _08009EFE
	movs r5, #1
	rsbs r5, r5, #0
_08009EFE:
	adds r0, r5, #0
_08009F00:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08009F08: .4byte 0x0000417A
_08009F0C: .4byte 0x00001432

