	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803EBA4
sub_0803EBA4: @ 0x0803EBA4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0xc
	mov r8, r0
	ldr r0, _0803EC00 @ =gUnknown_03003338
	ldr r4, [r0]
	movs r3, #0
	ldrh r0, [r4]
	cmp r0, #0
	bne _0803EBC6
	adds r1, r4, #0
_0803EBBC:
	adds r1, #8
	adds r3, #1
	ldrh r0, [r1]
	cmp r0, #0
	beq _0803EBBC
_0803EBC6:
	ldr r2, _0803EC04 @ =gUnknown_08499594
	lsls r0, r3, #3
	adds r0, r0, r4
	ldrh r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, [r2]
	adds r7, r1, r0
	mov r1, r8
	adds r1, #0x4c
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #3
	adds r2, r0, r4
	ldrh r0, [r2]
	adds r6, r1, #0
	cmp r0, #0
	bne _0803ECDC
	ldrh r0, [r2, #2]
	subs r0, #1
	cmp r0, #4
	bhi _0803ECCE
	lsls r0, r0, #2
	ldr r1, _0803EC08 @ =_0803EC0C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0803EC00: .4byte gUnknown_03003338
_0803EC04: .4byte gUnknown_08499594
_0803EC08: .4byte _0803EC0C
_0803EC0C: @ jump table
	.4byte _0803EC20 @ case 0
	.4byte _0803EC34 @ case 1
	.4byte _0803EC60 @ case 2
	.4byte _0803EC86 @ case 3
	.4byte _0803ECBC @ case 4
_0803EC20:
	movs r0, #0
	ldrsh r1, [r6, r0]
	lsls r1, r1, #3
	adds r1, r1, r4
	ldrh r0, [r1, #4]
	ldrh r1, [r1, #6]
	mov r2, r8
	bl sub_0803EF44
	b _0803ECCE
_0803EC34:
	movs r2, #0
	ldrsh r1, [r6, r2]
	lsls r1, r1, #3
	adds r1, r1, r4
	ldrh r0, [r1, #4]
	ldrh r1, [r1, #6]
	ldr r4, _0803EC58 @ =gUnknown_0849F728
	ldr r2, _0803EC5C @ =gUnknown_03004080
	ldrh r3, [r2]
	movs r2, #1
	ands r2, r3
	lsls r2, r2, #2
	adds r2, r2, r4
	ldr r2, [r2]
	mov r3, r8
	bl sub_0803F2B8
	b _0803ECCE
	.align 2, 0
_0803EC58: .4byte gUnknown_0849F728
_0803EC5C: .4byte gUnknown_03004080
_0803EC60:
	movs r0, #0
	ldrsh r1, [r6, r0]
	lsls r1, r1, #3
	adds r1, r1, r4
	ldrh r0, [r1, #4]
	ldrh r1, [r1, #6]
	bl sub_0803DE94
	adds r5, r0, #0
	movs r2, #0
	ldrsh r1, [r6, r2]
	lsls r1, r1, #3
	adds r1, r1, r4
	ldrh r0, [r1, #4]
	ldrh r1, [r1, #6]
	ldrb r2, [r7, #2]
	ldrb r3, [r7, #3]
	movs r4, #3
	b _0803ECAA
_0803EC86:
	movs r0, #0
	ldrsh r1, [r6, r0]
	lsls r1, r1, #3
	adds r1, r1, r4
	ldrh r0, [r1, #4]
	ldrh r1, [r1, #6]
	bl sub_0803DE94
	adds r5, r0, #0
	movs r2, #0
	ldrsh r1, [r6, r2]
	lsls r1, r1, #3
	adds r1, r1, r4
	ldrh r0, [r1, #4]
	ldrh r1, [r1, #6]
	ldrb r2, [r7, #2]
	ldrb r3, [r7, #3]
	movs r4, #4
_0803ECAA:
	str r4, [sp]
	ldrb r4, [r5, #3]
	lsrs r4, r4, #6
	str r4, [sp, #4]
	mov r4, r8
	str r4, [sp, #8]
	bl sub_0803F0A4
	b _0803ECCE
_0803ECBC:
	movs r0, #0
	ldrsh r1, [r6, r0]
	lsls r1, r1, #3
	adds r1, r1, r4
	ldrh r0, [r1, #4]
	ldrh r1, [r1, #6]
	mov r2, r8
	bl sub_0803F510
_0803ECCE:
	ldrh r0, [r6]
	adds r0, #1
	strh r0, [r6]
	mov r0, r8
	movs r1, #0
	bl Proc_Goto
_0803ECDC:
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

