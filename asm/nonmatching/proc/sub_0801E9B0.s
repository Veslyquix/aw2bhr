	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0801E9B0
sub_0801E9B0: @ 0x0801E9B0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x2c
	mov sb, r3
	ldr r3, [sp, #0x54]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov ip, r1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	str r2, [sp]
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	movs r1, #0x80
	lsls r1, r1, #1
	str r1, [sp, #0x1c]
	str r1, [sp, #0x18]
	movs r2, #0
	str r2, [sp, #0x20]
	mov r4, sb
	ldrh r4, [r4]
	str r4, [sp, #4]
	movs r1, #2
	add sb, r1
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	lsls r0, r4, #0x10
	asrs r6, r0, #0x10
	adds r0, r5, r6
	cmp r0, #0x80
	ble _0801E9F8
	movs r0, #1
	b _0801ECD2
_0801E9F8:
	ldr r0, _0801EB60 @ =gUnknown_0300054E
	strh r3, [r0]
	lsls r0, r3, #0x10
	asrs r4, r0, #0x10
	movs r1, #1
	rsbs r1, r1, #0
	str r0, [sp, #0x28]
	cmp r4, r1
	beq _0801EA26
	ldr r2, _0801EB64 @ =gUnknown_0200E438
	ldr r1, _0801EB68 @ =gUnknown_03001470
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #5
	adds r0, r0, r1
	ldrh r1, [r0, #0x26]
	movs r0, #0x4c
	muls r0, r1, r0
	adds r0, r0, r2
	ldrh r2, [r0, #0x3c]
	str r2, [sp, #0x18]
	ldrh r0, [r0, #0x3e]
	str r0, [sp, #0x1c]
_0801EA26:
	add r1, sp, #0x4c
	adds r0, r1, #0
	ldrh r0, [r0]
	str r0, [sp, #0xc]
	ldrh r4, [r1, #2]
	str r4, [sp, #0x10]
	ldrh r1, [r1, #4]
	str r1, [sp, #0x14]
	ldr r1, _0801EB6C @ =gUnknown_03002520
	lsls r0, r5, #3
	adds r7, r0, r1
	movs r0, #0
	str r0, [sp, #8]
	cmp r0, r6
	blt _0801EA46
	b _0801ECD0
_0801EA46:
	ldr r0, _0801EB70 @ =gUnknown_0808F0F8
	ldr r1, [r0]
	mov r8, r1
	movs r2, #0xc0
	lsls r2, r2, #8
	mov sl, r2
	mov r4, ip
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #0x24]
_0801EA5A:
	mov r0, sb
	ldrh r2, [r0]
	ldrh r4, [r0, #2]
	ldrh r5, [r0, #4]
	movs r3, #0xff
	lsls r3, r3, #8
	adds r1, r2, #0
	ands r1, r3
	ldr r0, [sp, #0xc]
	ands r0, r3
	adds r6, r1, r0
	movs r3, #0xff
	movs r1, #0xff
	ands r2, r1
	ldr r0, [sp, #0xc]
	ands r0, r1
	adds r2, r2, r0
	ands r2, r3
	orrs r6, r2
	mov r1, r8
	strh r6, [r1]
	movs r2, #0xce
	lsls r2, r2, #8
	adds r1, r4, #0
	ands r1, r2
	ldr r0, [sp, #0x10]
	ands r0, r2
	adds r3, r1, r0
	ldr r2, _0801EB74 @ =0x000001FF
	adds r1, r4, #0
	ands r1, r2
	ldr r0, [sp, #0x10]
	ands r0, r2
	adds r1, r1, r0
	ands r1, r2
	orrs r3, r1
	movs r0, #0xc0
	lsls r0, r0, #6
	ldr r2, [sp, #0x10]
	eors r4, r2
	ands r4, r0
	orrs r3, r4
	mov r4, r8
	strh r3, [r4, #2]
	ldr r1, [sp, #0x14]
	adds r5, r5, r1
	strh r5, [r4, #4]
	mov ip, r3
	mov r2, ip
	ands r2, r0
	mov ip, r2
	movs r4, #0x80
	lsls r4, r4, #1
	adds r1, r4, #0
	ldr r0, [sp, #0xc]
	ands r0, r1
	cmp r0, #0
	beq _0801EAD6
	movs r0, #0
	mov ip, r0
	movs r1, #1
	str r1, [sp, #0x20]
_0801EAD6:
	movs r5, #0x7f
	ands r5, r6
	movs r0, #0x80
	ands r0, r6
	cmp r0, #0
	beq _0801EAE8
	movs r0, #0x80
	rsbs r0, r0, #0
	orrs r5, r0
_0801EAE8:
	ldr r2, [sp, #0x20]
	cmp r2, #0
	bne _0801EB14
	movs r4, #0x80
	lsls r4, r4, #6
	adds r1, r4, #0
	ldr r0, [sp, #0x10]
	ands r0, r1
	cmp r0, #0
	beq _0801EB14
	mov r0, sl
	ands r3, r0
	lsrs r1, r3, #0xc
	ands r6, r0
	lsrs r0, r6, #0xa
	adds r1, r1, r0
	ldr r2, _0801EB78 @ =gUnknown_0848B6F8
	adds r1, r1, r2
	movs r4, #0
	ldrsh r0, [r1, r4]
	adds r0, r5, r0
	rsbs r5, r0, #0
_0801EB14:
	ldr r6, _0801EB7C @ =gUnknown_03000548
	ldrh r4, [r6, #2]
	ldrb r3, [r6, #2]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r1, #0
	ands r0, r4
	cmp r0, #0
	beq _0801EB2A
	ldr r0, _0801EB80 @ =0xFFFFFF00
	orrs r3, r0
_0801EB2A:
	ldr r2, [sp, #0x20]
	cmp r2, #0
	bne _0801EB88
	movs r0, #0x80
	lsls r0, r0, #5
	adds r1, r0, #0
	ldr r0, [sp, #0x10]
	ands r0, r1
	cmp r0, #0
	bne _0801EB40
	b _0801EC5C
_0801EB40:
	mov r1, sl
	ands r1, r4
	lsrs r1, r1, #0xc
	ldrh r2, [r6]
	mov r0, sl
	ands r0, r2
	lsrs r0, r0, #0xa
	adds r1, r1, r0
	ldr r2, _0801EB84 @ =gUnknown_0848B6F6
	adds r1, r1, r2
	movs r4, #0
	ldrsh r0, [r1, r4]
	adds r0, r3, r0
	rsbs r3, r0, #0
	b _0801EC5C
	.align 2, 0
_0801EB60: .4byte gUnknown_0300054E
_0801EB64: .4byte gUnknown_0200E438
_0801EB68: .4byte gUnknown_03001470
_0801EB6C: .4byte gUnknown_03002520
_0801EB70: .4byte gUnknown_0808F0F8
_0801EB74: .4byte 0x000001FF
_0801EB78: .4byte gUnknown_0848B6F8
_0801EB7C: .4byte gUnknown_03000548
_0801EB80: .4byte 0xFFFFFF00
_0801EB84: .4byte gUnknown_0848B6F6
_0801EB88:
	movs r0, #0x80
	lsls r0, r0, #2
	adds r1, r0, #0
	ldr r0, [sp, #0xc]
	ands r0, r1
	cmp r0, #0
	beq _0801EBF0
	mov r1, sl
	ands r1, r4
	lsrs r1, r1, #0xc
	ldrh r2, [r6]
	mov r0, sl
	ands r0, r2
	lsrs r0, r0, #0xa
	adds r1, r1, r0
	ldr r2, _0801EBE8 @ =gUnknown_0848B6F6
	adds r0, r1, r2
	movs r4, #0
	ldrsh r2, [r0, r4]
	adds r3, r3, r2
	ldr r0, _0801EBEC @ =gUnknown_0848B6F8
	adds r1, r1, r0
	movs r4, #0
	ldrsh r1, [r1, r4]
	adds r5, r5, r1
	ldr r4, [sp, #0x18]
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	muls r0, r3, r0
	cmp r0, #0
	bge _0801EBC8
	adds r0, #0xff
_0801EBC8:
	asrs r3, r0, #8
	ldr r4, [sp, #0x1c]
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	muls r0, r5, r0
	cmp r0, #0
	bge _0801EBD8
	adds r0, #0xff
_0801EBD8:
	asrs r5, r0, #8
	ldr r4, [sp, #0x24]
	adds r0, r3, r4
	subs r3, r0, r2
	ldr r2, [sp]
	lsls r0, r2, #0x10
	b _0801EC4A
	.align 2, 0
_0801EBE8: .4byte gUnknown_0848B6F6
_0801EBEC: .4byte gUnknown_0848B6F8
_0801EBF0:
	mov r2, sl
	ands r2, r4
	lsrs r2, r2, #0xc
	ldrh r1, [r6]
	mov r0, sl
	ands r0, r1
	lsrs r0, r0, #0xa
	adds r2, r2, r0
	ldr r4, _0801EC54 @ =gUnknown_0848B6F6
	adds r0, r2, r4
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r4, r0, #1
	adds r3, r3, r4
	ldr r0, _0801EC58 @ =gUnknown_0848B6F8
	adds r2, r2, r0
	movs r1, #0
	ldrsh r0, [r2, r1]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r1, r0, #1
	adds r5, r5, r1
	ldr r2, [sp, #0x18]
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	muls r0, r3, r0
	cmp r0, #0
	bge _0801EC2E
	adds r0, #0xff
_0801EC2E:
	asrs r3, r0, #8
	ldr r2, [sp, #0x1c]
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	muls r0, r5, r0
	cmp r0, #0
	bge _0801EC3E
	adds r0, #0xff
_0801EC3E:
	asrs r5, r0, #8
	ldr r2, [sp, #0x24]
	adds r0, r3, r2
	subs r3, r0, r4
	ldr r4, [sp]
	lsls r0, r4, #0x10
_0801EC4A:
	asrs r0, r0, #0x10
	adds r0, r5, r0
	subs r5, r0, r1
	b _0801EC68
	.align 2, 0
_0801EC54: .4byte gUnknown_0848B6F6
_0801EC58: .4byte gUnknown_0848B6F8
_0801EC5C:
	ldr r1, [sp]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	adds r5, r5, r0
	ldr r2, [sp, #0x24]
	adds r3, r3, r2
_0801EC68:
	mov r4, r8
	ldrh r1, [r4]
	movs r2, #0xff
	lsls r2, r2, #8
	adds r0, r2, #0
	ands r1, r0
	movs r0, #0xff
	ands r5, r0
	orrs r1, r5
	strh r1, [r4]
	ldrh r1, [r4, #2]
	movs r4, #0xfe
	lsls r4, r4, #8
	adds r0, r4, #0
	ands r1, r0
	ldr r2, _0801ECE4 @ =0x000001FF
	adds r0, r2, #0
	ands r3, r0
	orrs r1, r3
	mov r4, ip
	orrs r4, r1
	mov r0, r8
	strh r4, [r0, #2]
	ldr r1, [sp, #0x28]
	asrs r0, r1, #0x10
	mov r1, r8
	bl sub_080169A4
	mov r2, r8
	ldrh r0, [r2]
	strh r0, [r7]
	adds r7, #2
	ldrh r0, [r2, #2]
	strh r0, [r7]
	adds r7, #2
	ldrh r0, [r2, #4]
	strh r0, [r7]
	movs r4, #6
	add sb, r4
	adds r7, #4
	ldr r0, [sp, #8]
	lsls r1, r0, #0x10
	movs r2, #0x80
	lsls r2, r2, #9
	adds r1, r1, r2
	lsrs r4, r1, #0x10
	str r4, [sp, #8]
	ldr r2, [sp, #4]
	lsls r0, r2, #0x10
	cmp r1, r0
	bge _0801ECD0
	b _0801EA5A
_0801ECD0:
	movs r0, #0
_0801ECD2:
	add sp, #0x2c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0801ECE4: .4byte 0x000001FF

