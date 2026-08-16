	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0805EA54
sub_0805EA54: @ 0x0805EA54
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	movs r0, #0
	mov r8, r0
	movs r1, #1
	rsbs r1, r1, #0
	mov sb, r1
	mov sl, r0
	ldr r1, _0805EB40 @ =gUnknown_0816DA90
	ldr r4, [r1]
	ldr r2, [r4]
	ldrb r0, [r2, #4]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x19
	cmp r0, #0x32
	bhi _0805EB2E
	adds r0, r2, #0
	bl sub_080202A4
	ldr r0, _0805EB44 @ =gUnknown_0816DA94
	ldr r1, [r0]
	ldrh r5, [r1]
	adds r1, r5, #0
	adds r1, #0x40
	cmp r5, r1
	bge _0805EB08
	ldr r0, _0805EB48 @ =gUnknown_08499594
	ldr r1, [r0]
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #2
	adds r2, r0, r1
	adds r7, r2, #0
	ldr r6, [r4]
	ldrb r0, [r6]
	mov ip, r0
_0805EAA4:
	ldrb r1, [r2]
	cmp ip, r1
	bne _0805EAF8
	ldrb r0, [r6, #4]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x19
	ldrb r1, [r2, #4]
	lsls r4, r1, #0x19
	lsrs r1, r4, #0x19
	adds r0, r0, r1
	cmp r0, #0x64
	bgt _0805EAF8
	ldrb r1, [r6, #7]
	ldrb r0, [r2, #7]
	cmn r1, r0
	bne _0805EAF8
	cmp r6, r7
	beq _0805EAF8
	ldrb r1, [r2, #1]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0805EAF8
	lsrs r0, r4, #0x19
	cmp r0, r8
	ble _0805EAF8
	ldrb r3, [r2, #3]
	lsls r0, r3, #2
	ldr r1, _0805EB4C @ =gUnknown_03003340
	adds r0, r0, r1
	ldrb r1, [r2, #2]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	ble _0805EAF8
	mov sb, r1
	mov sl, r3
	lsrs r4, r4, #0x19
	mov r8, r4
_0805EAF8:
	adds r2, #0xc
	adds r7, #0xc
	adds r5, #1
	ldr r0, _0805EB50 @ =gUnknown_03003F2C
	ldrh r0, [r0]
	adds r0, #0x40
	cmp r5, r0
	blt _0805EAA4
_0805EB08:
	movs r0, #1
	rsbs r0, r0, #0
	cmp sb, r0
	beq _0805EB2E
	ldr r0, _0805EB54 @ =gUnknown_030040D8
	ldr r2, [r0]
	ldrb r1, [r2, #9]
	movs r0, #8
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2, #9]
	mov r0, sb
	mov r1, sl
	movs r2, #0
	str r2, [sp]
	movs r2, #0xa
	movs r3, #0
	bl sub_0805D648
_0805EB2E:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805EB40: .4byte gUnknown_0816DA90
_0805EB44: .4byte gUnknown_0816DA94
_0805EB48: .4byte gUnknown_08499594
_0805EB4C: .4byte gUnknown_03003340
_0805EB50: .4byte gUnknown_03003F2C
_0805EB54: .4byte gUnknown_030040D8

