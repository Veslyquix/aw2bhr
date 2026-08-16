	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08064A44
sub_08064A44: @ 0x08064A44
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	movs r6, #7
	movs r5, #0x54
	movs r4, #0
	ldr r0, _08064B44 @ =gUnknown_0816E0EC
	mov sl, r0
	ldr r1, _08064B48 @ =gUnknown_0816E0F0
	mov sb, r1
	ldr r0, _08064B4C @ =gUnknown_08580934
	mov r8, r0
	movs r1, #0xc0
	lsls r1, r1, #7
	adds r7, r1, #0
_08064A68:
	ldr r0, _08064B50 @ =gUnknown_0858096C
	movs r1, #3
	bl sub_080152EC
	mov ip, r0
	mov r1, r8
	ldr r0, [r1]
	lsls r3, r4, #2
	adds r0, #0x54
	adds r0, r0, r3
	mov r1, ip
	str r1, [r0]
	adds r1, #0x46
	movs r0, #0
	strb r0, [r1]
	mov r0, ip
	strh r6, [r0, #0x28]
	strh r5, [r0, #0x38]
	adds r6, #0x20
	subs r5, #8
	movs r0, #6
	subs r0, r0, r4
	mov r1, ip
	strh r0, [r1, #0x24]
	ldr r0, _08064B54 @ =gUnknown_0816E0D0
	lsls r2, r4, #1
	adds r0, r2, r0
	ldrh r0, [r0]
	adds r0, r7, r0
	strh r0, [r1, #0x3e]
	ldr r0, _08064B58 @ =gUnknown_0816E0DE
	adds r0, r2, r0
	ldrh r0, [r0]
	adds r1, r7, r0
	mov r0, ip
	adds r0, #0x40
	strh r1, [r0]
	ldr r0, _08064B5C @ =gUnknown_085809A4
	adds r2, r2, r0
	ldrh r0, [r2]
	mov r1, ip
	adds r1, #0x4b
	strb r0, [r1]
	mov r1, r8
	ldr r0, [r1]
	adds r0, #0x84
	adds r0, r0, r4
	ldrb r1, [r0]
	mov r0, ip
	adds r0, #0x48
	strb r1, [r0]
	mov r1, sl
	ldr r0, [r1]
	adds r3, r3, r0
	ldr r0, [r3]
	mov r1, ip
	str r0, [r1, #0x4c]
	mov r1, sb
	ldr r0, [r1]
	adds r0, r4, r0
	ldrb r1, [r0]
	mov r0, ip
	adds r0, #0x47
	strb r1, [r0]
	adds r4, #1
	cmp r4, #6
	ble _08064A68
	ldr r2, _08064B4C @ =gUnknown_08580934
	ldr r1, [r2]
	adds r0, r1, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #1
	bne _08064B06
	ldr r1, [r1, #0x6c]
	adds r1, #0x4b
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
_08064B06:
	ldr r0, [r2]
	ldr r2, [r0, #0x64]
	ldrb r1, [r0, #0x16]
	ldrb r0, [r0, #0x15]
	subs r1, r1, r0
	adds r1, #2
	adds r2, #0x4b
	strb r1, [r2]
	ldr r0, _08064B60 @ =gUnknown_085802AC
	ldr r1, _08064B64 @ =gUnknown_0200FC50
	movs r2, #0x8c
	lsls r2, r2, #2
	movs r3, #1
	str r3, [sp]
	str r3, [sp, #4]
	movs r3, #3
	str r3, [sp, #8]
	movs r3, #0xf
	bl sub_08073304
	bl sub_08030178
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08064B44: .4byte gUnknown_0816E0EC
_08064B48: .4byte gUnknown_0816E0F0
_08064B4C: .4byte gUnknown_08580934
_08064B50: .4byte gUnknown_0858096C
_08064B54: .4byte gUnknown_0816E0D0
_08064B58: .4byte gUnknown_0816E0DE
_08064B5C: .4byte gUnknown_085809A4
_08064B60: .4byte gUnknown_085802AC
_08064B64: .4byte gUnknown_0200FC50

