	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08088CDC
sub_08088CDC: @ 0x08088CDC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r4, r0, #0
	ldr r0, _08088D90 @ =gUnknown_030058E0
	mov r8, r0
	adds r7, r4, #0
	adds r7, #0x52
	ldrh r0, [r7]
	ldr r5, _08088D94 @ =gUnknown_03005948
	ldr r1, [r4, #0x58]
	adds r1, r1, r5
	ldrb r1, [r1]
	bl DivRem
	ldr r1, [r4, #0x5c]
	adds r0, r0, r1
	add r0, r8
	ldrb r6, [r0]
	ldrh r0, [r7]
	adds r0, #1
	ldr r1, [r4, #0x58]
	adds r1, r1, r5
	ldrb r1, [r1]
	bl DivRem
	ldr r1, [r4, #0x5c]
	adds r0, r0, r1
	add r0, r8
	ldrb r0, [r0]
	mov sb, r0
	ldrh r0, [r7]
	adds r0, #2
	ldr r1, [r4, #0x58]
	adds r1, r1, r5
	ldrb r1, [r1]
	bl DivRem
	ldr r1, [r4, #0x5c]
	adds r0, r0, r1
	add r0, r8
	ldrb r5, [r0]
	adds r4, #0x4c
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #9
	bne _08088D44
	adds r0, r6, #0
	movs r1, #0x40
	bl sub_08043BC8
_08088D44:
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0xa
	bne _08088D5C
	adds r0, r6, #0
	movs r1, #0x40
	bl sub_08043BF8
	adds r0, r6, #0
	movs r1, #0x11
	bl sub_08043AA0
_08088D5C:
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0x10
	bne _08088D82
	ldr r1, _08088D98 @ =0x06013000
	adds r0, r6, #0
	movs r2, #0x12
	bl sub_08043E3C
	ldr r1, _08088D9C @ =0x06013480
	mov r0, sb
	movs r2, #0x13
	bl sub_08043E3C
	ldr r1, _08088DA0 @ =0x06013900
	adds r0, r5, #0
	movs r2, #0x14
	bl sub_08043E3C
_08088D82:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08088D90: .4byte gUnknown_030058E0
_08088D94: .4byte gUnknown_03005948
_08088D98: .4byte 0x06013000
_08088D9C: .4byte 0x06013480
_08088DA0: .4byte 0x06013900

