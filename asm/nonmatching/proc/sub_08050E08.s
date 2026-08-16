	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08050E08
sub_08050E08: @ 0x08050E08
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldr r2, _08050EA4 @ =gUnknown_08553B1C
	ldr r0, _08050EA8 @ =gUnknown_020296B0
	lsls r1, r6, #2
	adds r1, r1, r6
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrb r0, [r1, #0x1c]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	mov sl, r0
	ldr r3, _08050EAC @ =gUnknown_085D81E8
	lsls r0, r6, #1
	mov ip, r0
	ldrh r1, [r1, #0x18]
	lsls r1, r1, #3
	adds r2, r0, r1
	ldr r5, _08050EB0 @ =gUnknown_03004580
	lsls r7, r6, #4
	adds r0, r5, #2
	adds r0, r7, r0
	ldrh r4, [r0]
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r2, r2, r0
	adds r2, r2, r3
	ldrh r2, [r2]
	mov r8, r2
	adds r1, r1, r0
	adds r1, r1, r3
	ldrh r1, [r1, #4]
	mov sb, r1
	ldr r2, _08050EB4 @ =gUnknown_08562128
	ldr r0, _08050EB8 @ =gUnknown_0300453C
	ldrh r0, [r0]
	lsls r0, r0, #4
	adds r1, r5, #0
	adds r1, #8
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r0, r0, r2
	ldrb r2, [r0]
	cmp r2, #4
	bne _08050E72
	movs r2, #1
_08050E72:
	lsls r1, r4, #1
	adds r1, r1, r4
	lsls r1, r1, #4
	add r1, sl
	lsls r2, r2, #2
	adds r0, r5, #4
	adds r0, r7, r0
	ldrh r3, [r0]
	lsls r0, r3, #4
	adds r2, r2, r0
	adds r1, r1, r2
	ldrh r4, [r1]
	ldrh r5, [r1, #2]
	cmp r3, #2
	bne _08050EC0
	ldr r1, _08050EBC @ =gUnknown_08553B18
	add r1, ip
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	ldrh r1, [r1]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	b _08050EE0
	.align 2, 0
_08050EA4: .4byte gUnknown_08553B1C
_08050EA8: .4byte gUnknown_020296B0
_08050EAC: .4byte gUnknown_085D81E8
_08050EB0: .4byte gUnknown_03004580
_08050EB4: .4byte gUnknown_08562128
_08050EB8: .4byte gUnknown_0300453C
_08050EBC: .4byte gUnknown_08553B18
_08050EC0:
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	mov r2, r8
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	mov r3, sb
	lsls r1, r3, #0x10
	asrs r1, r1, #0x10
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
_08050EE0:
	ldr r0, _08050F1C @ =gUnknown_03001FBC
	movs r2, #0
	ldrsh r1, [r0, r2]
	ldr r2, _08050F20 @ =gUnknown_02029A10
	movs r0, #0xb4
	muls r0, r6, r0
	adds r0, r0, r2
	lsls r2, r4, #0x10
	asrs r2, r2, #0x10
	ldrh r3, [r0, #8]
	adds r2, r2, r3
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	lsls r3, r5, #0x10
	asrs r3, r3, #0x10
	ldrh r0, [r0, #0xa]
	adds r3, r3, r0
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	adds r0, r6, #0
	bl sub_08050528
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08050F1C: .4byte gUnknown_03001FBC
_08050F20: .4byte gUnknown_02029A10

