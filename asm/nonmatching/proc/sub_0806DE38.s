	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806DE38
sub_0806DE38: @ 0x0806DE38
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	ldr r4, _0806DF14 @ =gUnknown_08580934
	ldr r1, [r4]
	ldrh r0, [r1, #0x2a]
	adds r0, #1
	strh r0, [r1, #0x2a]
	bl sub_0806DCB8
	ldr r0, _0806DF18 @ =gUnknown_0202F2C8
	ldrb r0, [r0]
	cmp r0, #0
	bne _0806DE7C
	ldr r1, [r4]
	adds r0, r1, #0
	adds r0, #0x33
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	adds r1, #0x54
	adds r1, r1, r0
	ldr r0, [r1]
	bl sub_0806DD34
	ldr r0, [r4]
	adds r0, #0x33
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl sub_0806DC50
_0806DE7C:
	bl sub_0806DDF4
	ldr r0, [r4]
	movs r1, #0x2a
	ldrsh r0, [r0, r1]
	lsls r0, r0, #4
	movs r1, #0xb4
	lsls r1, r1, #1
	bl __modsi3
	bl sub_0801BA4C
	lsls r0, r0, #0x10
	asrs r0, r0, #0x19
	movs r1, #0x80
	lsls r1, r1, #1
	adds r4, r0, r1
	ldr r5, _0806DF1C @ =gUnknown_0808F100
	adds r0, r5, #0
	adds r0, #0x80
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r7, r0, #4
	adds r1, r4, #0
	cmp r4, #0
	bne _0806DEB2
	movs r1, #2
_0806DEB2:
	adds r0, r7, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	movs r0, #0
	ldrsh r5, [r5, r0]
	rsbs r0, r5, #0
	lsls r0, r0, #4
	adds r1, r4, #0
	cmp r4, #0
	bne _0806DECE
	movs r1, #2
_0806DECE:
	bl Div
	lsls r0, r0, #0x10
	asrs r6, r0, #0x10
	lsls r0, r5, #4
	adds r1, r4, #0
	cmp r4, #0
	bne _0806DEE0
	movs r1, #2
_0806DEE0:
	bl Div
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	adds r1, r4, #0
	cmp r1, #0
	bne _0806DEF0
	movs r1, #2
_0806DEF0:
	adds r0, r7, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #0
	mov r1, r8
	adds r2, r6, #0
	adds r3, r5, #0
	bl sub_0801E108
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806DF14: .4byte gUnknown_08580934
_0806DF18: .4byte gUnknown_0202F2C8
_0806DF1C: .4byte gUnknown_0808F100

