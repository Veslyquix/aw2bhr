	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804AE78
sub_0804AE78: @ 0x0804AE78
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r4, _0804AF10 @ =gUnknown_03001FF8
	ldrh r0, [r4]
	adds r0, #6
	strh r0, [r4]
	ldr r1, _0804AF14 @ =gUnknown_0812A2A0
	ldr r2, [r1]
	ldrh r0, [r2]
	adds r0, #6
	strh r0, [r2]
	ldrh r0, [r2]
	movs r3, #0xec
	lsls r3, r3, #1
	mov sl, r1
	cmp r0, r3
	bls _0804AEA8
	ldr r1, _0804AF18 @ =0x000001D9
	adds r0, r1, #0
	strh r0, [r4]
	strh r3, [r2]
_0804AEA8:
	movs r1, #0
	ldr r3, _0804AF1C @ =gUnknown_0812A2A4
	mov sb, r3
	mov r8, r2
_0804AEB0:
	mov r2, r8
	ldrh r0, [r2]
	ldr r3, _0804AF20 @ =0xFFFFFEC8
	adds r0, r0, r3
	asrs r0, r0, #3
	adds r3, r0, #3
	movs r0, #0x1f
	ands r3, r0
	adds r0, r3, #3
	adds r6, r1, #1
	cmp r3, r0
	bge _0804AEEE
	lsls r5, r1, #5
	ldr r1, _0804AF24 @ =gUnknown_08499580
	mov ip, r1
	ldr r7, _0804AF28 @ =gUnknown_0849957C
	adds r4, r0, #0
_0804AED2:
	adds r0, r5, r3
	mov r1, ip
	ldr r2, [r1]
	lsls r0, r0, #1
	adds r2, r0, r2
	ldr r1, [r7]
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, r4
	blt _0804AED2
_0804AEEE:
	lsls r0, r6, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0x13
	bls _0804AEB0
	bl sub_08013B0C
	mov r2, sb
	ldr r0, [r2]
	ldr r1, [r0]
	ldrh r2, [r1, #0x2a]
	movs r3, #0x2a
	ldrsh r0, [r1, r3]
	cmp r0, #0xef
	bgt _0804AF2C
	adds r0, r2, #3
	b _0804AF2E
	.align 2, 0
_0804AF10: .4byte gUnknown_03001FF8
_0804AF14: .4byte gUnknown_0812A2A0
_0804AF18: .4byte 0x000001D9
_0804AF1C: .4byte gUnknown_0812A2A4
_0804AF20: .4byte 0xFFFFFEC8
_0804AF24: .4byte gUnknown_08499580
_0804AF28: .4byte gUnknown_0849957C
_0804AF2C:
	movs r0, #0xf0
_0804AF2E:
	strh r0, [r1, #0x2a]
	mov r1, sl
	ldr r0, [r1]
	ldrh r1, [r0]
	movs r0, #0xec
	lsls r0, r0, #1
	cmp r1, r0
	bne _0804AF54
	mov r2, sb
	ldr r0, [r2]
	ldr r0, [r0]
	movs r3, #0x2a
	ldrsh r0, [r0, r3]
	cmp r0, #0xf0
	bne _0804AF54
	ldr r0, _0804AF64 @ =gUnknown_03001FBC
	ldrb r0, [r0]
	bl sub_08015C30
_0804AF54:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804AF64: .4byte gUnknown_03001FBC

