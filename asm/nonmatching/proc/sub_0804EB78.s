	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804EB78
sub_0804EB78: @ 0x0804EB78
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x2c
	ldr r2, _0804ECD8 @ =gUnknown_03001470
	ldr r5, _0804ECDC @ =gUnknown_08136094
	ldr r0, [r5]
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #5
	adds r0, r2, #0
	adds r0, #0x30
	adds r0, r1, r0
	ldrh r7, [r0]
	adds r2, #0x34
	adds r1, r1, r2
	ldrh r1, [r1]
	mov r8, r1
	ldr r2, _0804ECE0 @ =gUnknown_08136098
	ldr r3, [r2]
	mov sl, r3
	lsls r0, r1, #3
	add r0, r8
	lsls r0, r0, #2
	movs r1, #0xb4
	adds r4, r7, #0
	muls r4, r1, r4
	mov ip, r4
	add r0, ip
	adds r6, r0, r3
	ldr r3, _0804ECE4 @ =gUnknown_0813609C
	ldr r2, [r3]
	mov r0, r8
	lsls r1, r0, #1
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #1
	str r0, [sp, #0x14]
	adds r1, r1, r0
	adds r2, r1, r2
	ldrh r0, [r2]
	ldrh r1, [r6, #0x20]
	adds r0, r0, r1
	strh r0, [r6, #0x20]
	ldrh r1, [r6, #0x20]
	movs r0, #0xf
	ands r1, r0
	cmp r1, #1
	bne _0804EC4A
	ldrh r0, [r6, #0x22]
	adds r0, #1
	strh r0, [r6, #0x22]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #3
	bne _0804EBF8
	movs r0, #0
	strh r0, [r2]
	movs r0, #0xff
	strh r0, [r6, #0x20]
_0804EBF8:
	ldrh r1, [r6, #0x22]
	lsls r2, r1, #3
	adds r3, r2, r1
	lsls r4, r3, #2
	add r4, ip
	add r4, sl
	ldr r0, _0804ECE8 @ =gUnknown_08552148
	lsls r5, r7, #1
	adds r5, r5, r0
	ldrh r0, [r5]
	lsls r2, r0, #3
	adds r2, r2, r0
	lsls r2, r2, #2
	add r2, ip
	add r2, sl
	ldr r6, _0804ECEC @ =gUnknown_085534C4
	lsls r3, r1, #1
	ldr r0, [sp, #0x14]
	adds r3, r0, r3
	lsls r0, r3, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	ldrh r2, [r2, #8]
	adds r0, r0, r2
	strh r0, [r4, #8]
	ldrh r0, [r5]
	lsls r2, r0, #3
	adds r2, r2, r0
	lsls r2, r2, #2
	add r2, ip
	add r2, sl
	adds r3, #1
	lsls r3, r3, #1
	adds r3, r3, r6
	ldrh r0, [r3]
	ldrh r2, [r2, #0xa]
	adds r0, r0, r2
	strh r0, [r4, #0xa]
	adds r0, r7, #0
	bl sub_080520B8
_0804EC4A:
	adds r0, r7, #0
	mov r1, r8
	bl sub_08056E9C
	ldr r1, _0804ECF0 @ =gUnknown_03001FBC
	movs r3, #0
	ldrsh r2, [r1, r3]
	adds r0, r7, #0
	mov r1, r8
	bl sub_0804BECC
	lsls r4, r7, #2
	mov sb, r4
	ldr r1, _0804ECF4 @ =gUnknown_084C3F78
	add r1, sb
	ldr r1, [r1]
	str r1, [sp, #0x10]
	ldr r3, _0804ECF8 @ =gUnknown_02029A10
	mov r1, r8
	lsls r1, r1, #3
	mov sl, r1
	add r1, r8
	lsls r1, r1, #2
	movs r2, #0xb4
	muls r2, r7, r2
	adds r1, r1, r2
	adds r6, r1, r3
	ldr r2, _0804ECFC @ =gUnknown_08553B28
	lsls r0, r0, #0x10
	asrs r0, r0, #0xf
	lsls r3, r7, #1
	str r3, [sp, #0x28]
	adds r1, r3, r7
	lsls r1, r1, #2
	adds r0, r0, r1
	adds r0, r0, r2
	ldrh r0, [r0]
	ldrh r4, [r6, #8]
	adds r0, r0, r4
	strh r0, [r6, #8]
	ldr r1, _0804ED00 @ =gUnknown_085644D4
	ldr r0, _0804ED04 @ =gUnknown_02028E5C
	add r0, sb
	ldrh r0, [r0, #2]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r6, #0xa]
	ldrh r0, [r0]
	subs r1, r1, r0
	strh r1, [r6, #0xa]
	ldr r1, _0804ED08 @ =gUnknown_02029B80
	mov r2, sb
	adds r0, r2, r7
	add r0, r8
	lsls r4, r0, #1
	adds r5, r4, r1
	ldrh r0, [r5]
	cmp r0, #0
	bne _0804ED0C
	ldrh r0, [r6, #0x20]
	cmp r0, #0
	bne _0804ED60
	ldr r3, _0804ECF0 @ =gUnknown_03001FBC
	movs r4, #0
	ldrsh r2, [r3, r4]
	adds r0, r7, #0
	mov r1, r8
	bl sub_0804EDAC
	b _0804ED60
	.align 2, 0
_0804ECD8: .4byte gUnknown_03001470
_0804ECDC: .4byte gUnknown_08136094
_0804ECE0: .4byte gUnknown_08136098
_0804ECE4: .4byte gUnknown_0813609C
_0804ECE8: .4byte gUnknown_08552148
_0804ECEC: .4byte gUnknown_085534C4
_0804ECF0: .4byte gUnknown_03001FBC
_0804ECF4: .4byte gUnknown_084C3F78
_0804ECF8: .4byte gUnknown_02029A10
_0804ECFC: .4byte gUnknown_08553B28
_0804ED00: .4byte gUnknown_085644D4
_0804ED04: .4byte gUnknown_02028E5C
_0804ED08: .4byte gUnknown_02029B80
_0804ED0C:
	movs r0, #0x23
	bl sub_0803B48C
	movs r0, #0
	strh r0, [r5]
	ldr r0, _0804ED9C @ =gUnknown_02029B94
	adds r0, r4, r0
	movs r1, #1
	strh r1, [r0]
	movs r1, #0
	strh r1, [r6, #0x14]
	mov r0, sp
	strh r7, [r0]
	adds r0, #2
	mov r2, r8
	strh r2, [r0]
	ldr r2, _0804EDA0 @ =gUnknown_085534BC
	mov r3, sb
	adds r0, r3, r2
	ldrh r1, [r0]
	add r0, sp, #4
	strh r1, [r0]
	ldr r0, [sp, #0x28]
	adds r0, #1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r1, [r0]
	mov r0, sp
	adds r0, #6
	strh r1, [r0]
	add r1, sp, #8
	movs r0, #0x20
	strh r0, [r1]
	adds r1, #2
	movs r0, #0x10
	strh r0, [r1]
	add r1, sp, #0xc
	movs r0, #0x64
	strh r0, [r1]
	mov r0, sp
	bl sub_08056E28
_0804ED60:
	ldr r0, _0804EDA4 @ =gUnknown_03001FBC
	movs r4, #0
	ldrsh r0, [r0, r4]
	ldr r3, _0804EDA8 @ =gUnknown_02029A10
	mov r2, sl
	add r2, r8
	lsls r2, r2, #2
	movs r1, #0xb4
	muls r1, r7, r1
	adds r2, r2, r1
	adds r2, r2, r3
	movs r3, #8
	ldrsh r1, [r2, r3]
	ldrh r2, [r2, #0xa]
	ldr r4, [sp, #0x10]
	ldrh r3, [r4]
	subs r2, r2, r3
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	bl sub_080155C0
	add sp, #0x2c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804ED9C: .4byte gUnknown_02029B94
_0804EDA0: .4byte gUnknown_085534BC
_0804EDA4: .4byte gUnknown_03001FBC
_0804EDA8: .4byte gUnknown_02029A10

