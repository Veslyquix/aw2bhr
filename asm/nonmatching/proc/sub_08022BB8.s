	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08022BB8
sub_08022BB8: @ 0x08022BB8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r7, r2, #0x10
	movs r0, #0
	movs r1, #0
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r0, _08022BE8 @ =gUnknown_03004008
	ldr r0, [r0]
	movs r1, #0x21
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #4
	bhi _08022BEC
	movs r4, #0
	b _08022BFA
	.align 2, 0
_08022BE8: .4byte gUnknown_03004008
_08022BEC:
	cmp r4, #8
	bls _08022BF8
	cmp r4, #0x1c
	bhi _08022BF8
	movs r4, #4
	b _08022BFA
_08022BF8:
	movs r4, #2
_08022BFA:
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	cmp r0, #5
	beq _08022C6C
	cmp r0, #5
	bgt _08022C0C
	cmp r0, #4
	beq _08022C14
	b _08022DBA
_08022C0C:
	cmp r0, #6
	bne _08022C12
	b _08022D1C
_08022C12:
	b _08022DBA
_08022C14:
	lsls r0, r6, #0x10
	asrs r1, r0, #0x10
	adds r7, r0, #0
	cmp r1, #0xcf
	ble _08022C40
	lsls r0, r5, #0x10
	asrs r1, r0, #0x10
	adds r5, r0, #0
	cmp r1, #0x8f
	ble _08022C38
	adds r0, r4, #6
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r6, _08022C34 @ =gUnknown_08499BA0
	b _08022CBE
	.align 2, 0
_08022C34: .4byte gUnknown_08499BA0
_08022C38:
	ldr r6, _08022C3C @ =gUnknown_08499BB4
	b _08022CBE
	.align 2, 0
_08022C3C: .4byte gUnknown_08499BB4
_08022C40:
	lsls r0, r5, #0x10
	asrs r1, r0, #0x10
	adds r5, r0, #0
	cmp r1, #0x7f
	ble _08022C5C
	adds r0, r4, #0
	adds r0, #0x12
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r6, _08022C58 @ =gUnknown_08499BC8
	b _08022CBE
	.align 2, 0
_08022C58: .4byte gUnknown_08499BC8
_08022C5C:
	adds r0, r4, #0
	adds r0, #0xc
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r6, _08022C68 @ =gUnknown_08499B8C
	b _08022CBE
	.align 2, 0
_08022C68: .4byte gUnknown_08499B8C
_08022C6C:
	lsls r0, r6, #0x10
	asrs r1, r0, #0x10
	adds r7, r0, #0
	cmp r1, #0xcf
	ble _08022C98
	lsls r0, r5, #0x10
	asrs r1, r0, #0x10
	adds r5, r0, #0
	cmp r1, #0x8f
	ble _08022C90
	adds r0, r4, #6
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r6, _08022C8C @ =gUnknown_08499BF0
	b _08022CBE
	.align 2, 0
_08022C8C: .4byte gUnknown_08499BF0
_08022C90:
	ldr r6, _08022C94 @ =gUnknown_08499C04
	b _08022CBE
	.align 2, 0
_08022C94: .4byte gUnknown_08499C04
_08022C98:
	lsls r0, r5, #0x10
	asrs r1, r0, #0x10
	adds r5, r0, #0
	cmp r1, #0x7f
	ble _08022CB4
	adds r0, r4, #0
	adds r0, #0x12
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r6, _08022CB0 @ =gUnknown_08499C18
	b _08022CBE
	.align 2, 0
_08022CB0: .4byte gUnknown_08499C18
_08022CB4:
	adds r0, r4, #0
	adds r0, #0xc
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r6, _08022D0C @ =gUnknown_08499BDC
_08022CBE:
	add r2, sp, #8
	ldrh r1, [r2, #4]
	ldr r0, _08022D10 @ =0xFFFFFC00
	ands r0, r1
	ldr r3, _08022D14 @ =0x00000365
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2, #4]
	ldrb r1, [r2, #5]
	movs r0, #0xf
	ands r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #5]
	ldr r3, _08022D18 @ =gUnknown_080909B8
	lsls r1, r4, #1
	adds r1, r1, r3
	asrs r0, r7, #0x10
	ldrh r1, [r1]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r2, r4, #1
	lsls r2, r2, #1
	adds r2, r2, r3
	asrs r1, r5, #0x10
	ldrh r2, [r2]
	adds r1, r1, r2
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r3, [sp, #8]
	ldr r4, [sp, #0xc]
	movs r2, #1
	str r2, [sp, #4]
	str r4, [sp]
	adds r2, r6, #0
	bl sub_0801C01C
	b _08022DBA
	.align 2, 0
_08022D0C: .4byte gUnknown_08499BDC
_08022D10: .4byte 0xFFFFFC00
_08022D14: .4byte 0x00000365
_08022D18: .4byte gUnknown_080909B8
_08022D1C:
	lsls r0, r6, #0x10
	asrs r1, r0, #0x10
	adds r7, r0, #0
	cmp r1, #0xcf
	ble _08022D48
	lsls r0, r5, #0x10
	asrs r1, r0, #0x10
	adds r5, r0, #0
	cmp r1, #0x8f
	ble _08022D40
	adds r0, r4, #6
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r6, _08022D3C @ =gUnknown_08499C40
	b _08022D6E
	.align 2, 0
_08022D3C: .4byte gUnknown_08499C40
_08022D40:
	ldr r6, _08022D44 @ =gUnknown_08499C54
	b _08022D6E
	.align 2, 0
_08022D44: .4byte gUnknown_08499C54
_08022D48:
	lsls r0, r5, #0x10
	asrs r1, r0, #0x10
	adds r5, r0, #0
	cmp r1, #0x7f
	ble _08022D64
	adds r0, r4, #0
	adds r0, #0x12
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r6, _08022D60 @ =gUnknown_08499C68
	b _08022D6E
	.align 2, 0
_08022D60: .4byte gUnknown_08499C68
_08022D64:
	adds r0, r4, #0
	adds r0, #0xc
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r6, _08022DC4 @ =gUnknown_08499C2C
_08022D6E:
	add r2, sp, #8
	ldrh r1, [r2, #4]
	ldr r0, _08022DC8 @ =0xFFFFFC00
	ands r0, r1
	ldr r3, _08022DCC @ =0x00000365
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2, #4]
	ldrb r1, [r2, #5]
	movs r0, #0xf
	ands r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #5]
	ldr r3, _08022DD0 @ =gUnknown_080909B8
	lsls r1, r4, #1
	adds r1, r1, r3
	asrs r0, r7, #0x10
	ldrh r1, [r1]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r2, r4, #1
	lsls r2, r2, #1
	adds r2, r2, r3
	asrs r1, r5, #0x10
	ldrh r2, [r2]
	adds r1, r1, r2
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r3, [sp, #8]
	ldr r4, [sp, #0xc]
	movs r2, #1
	str r2, [sp, #4]
	str r4, [sp]
	adds r2, r6, #0
	bl sub_0801C01C
_08022DBA:
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08022DC4: .4byte gUnknown_08499C2C
_08022DC8: .4byte 0xFFFFFC00
_08022DCC: .4byte 0x00000365
_08022DD0: .4byte gUnknown_080909B8

