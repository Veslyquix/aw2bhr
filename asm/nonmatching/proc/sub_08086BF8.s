	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08086BF8
sub_08086BF8: @ 0x08086BF8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	adds r6, r0, #0
	adds r5, r1, #0
	mov r8, r2
	bl sub_08013C00
	ldr r4, _08086C90 @ =gUnknown_081D943C
	ldr r0, [r4]
	ldr r2, [r0]
	ldr r1, _08086C94 @ =gUnknown_08499CE4
	ldr r0, _08086C98 @ =gUnknown_0300596C
	movs r3, #0
	ldrsh r0, [r0, r3]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r3, [r0]
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	movs r1, #5
	bl sub_08014A5C
	ldr r0, _08086C9C @ =gUnknown_02027F74
	adds r1, r0, #0
	adds r1, #0x37
	ldrb r1, [r1]
	mov sb, r4
	cmp r1, r5
	bge _08086C3E
	adds r5, r1, #1
_08086C3E:
	cmp r5, #2
	ble _08086C44
	movs r5, #2
_08086C44:
	cmp r5, #0
	ble _08086CD2
	movs r7, #0
	adds r0, #4
	adds r4, r6, r0
	adds r6, r5, #0
_08086C50:
	ldrb r0, [r4]
	bl sub_0803CB24
	lsls r0, r0, #0x18
	movs r5, #1
	cmp r0, #0
	beq _08086C60
	movs r5, #0
_08086C60:
	ldrb r0, [r4]
	cmp r0, #0xb3
	bhi _08086CA4
	bl sub_0803CA54
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0
	bne _08086CA4
	mov r1, r8
	adds r1, #9
	adds r1, r7, r1
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	mov r2, sb
	ldr r0, [r2]
	ldr r2, [r0]
	str r3, [sp]
	str r5, [sp, #4]
	movs r0, #1
	ldr r3, _08086CA0 @ =gUnknown_084C3F50
	bl sub_080149C0
	b _08086CC8
	.align 2, 0
_08086C90: .4byte gUnknown_081D943C
_08086C94: .4byte gUnknown_08499CE4
_08086C98: .4byte gUnknown_0300596C
_08086C9C: .4byte gUnknown_02027F74
_08086CA0: .4byte gUnknown_084C3F50
_08086CA4:
	ldrb r0, [r4]
	bl sub_08024944
	adds r3, r0, #0
	mov r1, r8
	adds r1, #9
	adds r1, r7, r1
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	mov r2, sb
	ldr r0, [r2]
	ldr r2, [r0]
	movs r0, #0
	str r0, [sp]
	str r5, [sp, #4]
	movs r0, #1
	bl sub_080149C0
_08086CC8:
	adds r7, #2
	adds r4, #1
	subs r6, #1
	cmp r6, #0
	bne _08086C50
_08086CD2:
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

