	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08050D44
sub_08050D44: @ 0x08050D44
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	mov ip, r5
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	ldr r2, _08050DEC @ =gUnknown_08553B1C
	ldr r1, _08050DF0 @ =gUnknown_020296B0
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrb r0, [r0, #0x1c]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r6, [r0]
	ldr r2, _08050DF4 @ =gUnknown_08562128
	ldr r4, _08050DF8 @ =gUnknown_03004580
	ldr r0, _08050DFC @ =gUnknown_0300453C
	ldrh r0, [r0]
	lsls r0, r0, #4
	adds r1, r4, #0
	adds r1, #8
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r0, r0, r2
	ldrb r2, [r0]
	cmp r2, #4
	bne _08050D80
	movs r2, #2
_08050D80:
	lsls r3, r5, #4
	adds r0, r4, #2
	adds r0, r3, r0
	ldrh r0, [r0]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #4
	adds r1, r1, r6
	lsls r2, r2, #2
	adds r0, r4, #4
	adds r3, r3, r0
	ldrh r0, [r3]
	lsls r0, r0, #4
	adds r2, r2, r0
	adds r1, r1, r2
	ldrh r4, [r1]
	ldrh r6, [r1, #2]
	cmp r5, #0
	beq _08050DAC
	lsls r0, r4, #0x10
	rsbs r0, r0, #0
	lsrs r4, r0, #0x10
_08050DAC:
	ldr r0, _08050E00 @ =gUnknown_03001FBC
	movs r2, #0
	ldrsh r1, [r0, r2]
	ldr r3, _08050E04 @ =gUnknown_02029A10
	lsls r0, r7, #3
	adds r0, r0, r7
	lsls r0, r0, #2
	movs r2, #0xb4
	mov r5, ip
	muls r5, r2, r5
	adds r2, r5, #0
	adds r0, r0, r2
	adds r0, r0, r3
	lsls r2, r4, #0x10
	asrs r2, r2, #0x10
	ldrh r3, [r0, #8]
	adds r2, r2, r3
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	lsls r3, r6, #0x10
	asrs r3, r3, #0x10
	ldrh r0, [r0, #0xa]
	adds r3, r3, r0
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	mov r0, ip
	bl sub_08050528
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08050DEC: .4byte gUnknown_08553B1C
_08050DF0: .4byte gUnknown_020296B0
_08050DF4: .4byte gUnknown_08562128
_08050DF8: .4byte gUnknown_03004580
_08050DFC: .4byte gUnknown_0300453C
_08050E00: .4byte gUnknown_03001FBC
_08050E04: .4byte gUnknown_02029A10

