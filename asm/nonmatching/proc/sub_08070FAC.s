	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08070FAC
sub_08070FAC: @ 0x08070FAC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	ldr r0, _08070FCC @ =gUnknown_03007FF0
	ldr r0, [r0]
	str r0, [sp, #4]
	ldrb r0, [r0, #0xa]
	cmp r0, #0
	beq _08070FD0
	subs r0, #1
	ldr r1, [sp, #4]
	strb r0, [r1, #0xa]
	b _08070FD6
	.align 2, 0
_08070FCC: .4byte gUnknown_03007FF0
_08070FD0:
	movs r0, #0xe
	ldr r2, [sp, #4]
	strb r0, [r2, #0xa]
_08070FD6:
	movs r6, #1
	ldr r0, [sp, #4]
	ldr r4, [r0, #0x1c]
_08070FDC:
	ldrb r1, [r4]
	movs r0, #0xc7
	ands r0, r1
	adds r2, r6, #1
	mov sl, r2
	movs r2, #0x40
	adds r2, r2, r4
	mov sb, r2
	cmp r0, #0
	bne _08070FF2
	b _080713DC
_08070FF2:
	cmp r6, #2
	beq _08071024
	cmp r6, #2
	bgt _08071000
	cmp r6, #1
	beq _08071006
	b _0807105C
_08071000:
	cmp r6, #3
	beq _0807103C
	b _0807105C
_08071006:
	ldr r0, _08071018 @ =0x04000060
	str r0, [sp, #8]
	ldr r7, _0807101C @ =0x04000062
	ldr r2, _08071020 @ =0x04000063
	str r2, [sp, #0xc]
	adds r0, #4
	str r0, [sp, #0x10]
	adds r2, #2
	b _0807106C
	.align 2, 0
_08071018: .4byte 0x04000060
_0807101C: .4byte 0x04000062
_08071020: .4byte 0x04000063
_08071024:
	ldr r0, _08071030 @ =0x04000061
	str r0, [sp, #8]
	ldr r7, _08071034 @ =0x04000068
	ldr r2, _08071038 @ =0x04000069
	b _08071064
	.align 2, 0
_08071030: .4byte 0x04000061
_08071034: .4byte 0x04000068
_08071038: .4byte 0x04000069
_0807103C:
	ldr r0, _08071050 @ =0x04000070
	str r0, [sp, #8]
	ldr r7, _08071054 @ =0x04000072
	ldr r2, _08071058 @ =0x04000073
	str r2, [sp, #0xc]
	adds r0, #4
	str r0, [sp, #0x10]
	adds r2, #2
	b _0807106C
	.align 2, 0
_08071050: .4byte 0x04000070
_08071054: .4byte 0x04000072
_08071058: .4byte 0x04000073
_0807105C:
	ldr r0, _080710BC @ =0x04000071
	str r0, [sp, #8]
	ldr r7, _080710C0 @ =0x04000078
	ldr r2, _080710C4 @ =0x04000079
_08071064:
	str r2, [sp, #0xc]
	adds r0, #0xb
	str r0, [sp, #0x10]
	adds r2, #4
_0807106C:
	str r2, [sp, #0x14]
	ldr r0, [sp, #4]
	ldrb r0, [r0, #0xa]
	str r0, [sp]
	ldr r2, [sp, #0xc]
	ldrb r0, [r2]
	mov r8, r0
	adds r2, r1, #0
	movs r0, #0x80
	ands r0, r2
	cmp r0, #0
	beq _08071162
	movs r3, #0x40
	adds r0, r3, #0
	ands r0, r2
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r0, r6, #1
	mov sl, r0
	movs r1, #0x40
	adds r1, r1, r4
	mov sb, r1
	cmp r5, #0
	bne _08071186
	movs r0, #3
	strb r0, [r4]
	strb r0, [r4, #0x1d]
	adds r0, r4, #0
	str r3, [sp, #0x18]
	bl sub_08070F44
	ldr r3, [sp, #0x18]
	cmp r6, #2
	beq _080710D4
	cmp r6, #2
	bgt _080710C8
	cmp r6, #1
	beq _080710CE
	b _08071128
	.align 2, 0
_080710BC: .4byte 0x04000071
_080710C0: .4byte 0x04000078
_080710C4: .4byte 0x04000079
_080710C8:
	cmp r6, #3
	beq _080710E0
	b _08071128
_080710CE:
	ldrb r0, [r4, #0x1f]
	ldr r2, [sp, #8]
	strb r0, [r2]
_080710D4:
	ldr r0, [r4, #0x24]
	lsls r0, r0, #6
	ldrb r1, [r4, #0x1e]
	adds r0, r1, r0
	strb r0, [r7]
	b _08071134
_080710E0:
	ldr r1, [r4, #0x24]
	ldr r0, [r4, #0x28]
	cmp r1, r0
	beq _08071108
	ldr r2, [sp, #8]
	strb r3, [r2]
	ldr r1, _0807111C @ =0x04000090
	ldr r2, [r4, #0x24]
	ldr r0, [r2]
	str r0, [r1]
	adds r1, #4
	ldr r0, [r2, #4]
	str r0, [r1]
	adds r1, #4
	ldr r0, [r2, #8]
	str r0, [r1]
	adds r1, #4
	ldr r0, [r2, #0xc]
	str r0, [r1]
	str r2, [r4, #0x28]
_08071108:
	ldr r0, [sp, #8]
	strb r5, [r0]
	ldrb r0, [r4, #0x1e]
	strb r0, [r7]
	ldrb r0, [r4, #0x1e]
	cmp r0, #0
	beq _08071120
	movs r0, #0xc0
	b _08071142
	.align 2, 0
_0807111C: .4byte 0x04000090
_08071120:
	movs r1, #0x80
	rsbs r1, r1, #0
	strb r1, [r4, #0x1a]
	b _08071144
_08071128:
	ldrb r0, [r4, #0x1e]
	strb r0, [r7]
	ldr r0, [r4, #0x24]
	lsls r0, r0, #3
	ldr r2, [sp, #0x10]
	strb r0, [r2]
_08071134:
	ldrb r0, [r4, #4]
	adds r0, #8
	mov r8, r0
	ldrb r0, [r4, #0x1e]
	cmp r0, #0
	beq _08071142
	movs r0, #0x40
_08071142:
	strb r0, [r4, #0x1a]
_08071144:
	ldrb r1, [r4, #4]
	movs r2, #0
	strb r1, [r4, #0xb]
	movs r0, #0xff
	ands r0, r1
	adds r1, r6, #1
	mov sl, r1
	movs r1, #0x40
	adds r1, r1, r4
	mov sb, r1
	cmp r0, #0
	bne _0807115E
	b _0807129A
_0807115E:
	strb r2, [r4, #9]
	b _080712C8
_08071162:
	movs r0, #4
	ands r0, r2
	cmp r0, #0
	beq _08071194
	ldrb r0, [r4, #0xd]
	subs r0, #1
	strb r0, [r4, #0xd]
	movs r2, #0xff
	ands r0, r2
	lsls r0, r0, #0x18
	adds r1, r6, #1
	mov sl, r1
	movs r2, #0x40
	adds r2, r2, r4
	mov sb, r2
	cmp r0, #0
	ble _08071186
	b _080712DA
_08071186:
	lsls r0, r6, #0x18
	lsrs r0, r0, #0x18
	bl sub_08070EF4
	movs r0, #0
	strb r0, [r4]
	b _080713D8
_08071194:
	movs r0, #0x40
	ands r0, r1
	adds r2, r6, #1
	mov sl, r2
	movs r2, #0x40
	adds r2, r2, r4
	mov sb, r2
	cmp r0, #0
	beq _080711D4
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	beq _080711D4
	movs r0, #0xfc
	ands r0, r1
	movs r2, #0
	strb r0, [r4]
	ldrb r1, [r4, #7]
	strb r1, [r4, #0xb]
	movs r0, #0xff
	ands r0, r1
	cmp r0, #0
	beq _08071206
	movs r0, #1
	ldrb r1, [r4, #0x1d]
	orrs r0, r1
	strb r0, [r4, #0x1d]
	cmp r6, #3
	beq _080712C8
	ldrb r2, [r4, #7]
	mov r8, r2
	b _080712C8
_080711D4:
	ldrb r0, [r4, #0xb]
	cmp r0, #0
	bne _080712C8
	cmp r6, #3
	bne _080711E6
	movs r0, #1
	ldrb r1, [r4, #0x1d]
	orrs r0, r1
	strb r0, [r4, #0x1d]
_080711E6:
	adds r0, r4, #0
	bl sub_08070F44
	movs r0, #3
	ldrb r2, [r4]
	ands r0, r2
	cmp r0, #0
	bne _0807123A
	ldrb r0, [r4, #9]
	subs r0, #1
	strb r0, [r4, #9]
	movs r1, #0xff
	ands r0, r1
	lsls r0, r0, #0x18
	cmp r0, #0
	bgt _08071236
_08071206:
	ldrb r2, [r4, #0xc]
	ldrb r1, [r4, #0xa]
	adds r0, r2, #0
	muls r0, r1, r0
	adds r0, #0xff
	asrs r0, r0, #8
	movs r1, #0
	strb r0, [r4, #9]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08071186
	movs r0, #4
	ldrb r2, [r4]
	orrs r0, r2
	strb r0, [r4]
	movs r0, #1
	ldrb r1, [r4, #0x1d]
	orrs r0, r1
	strb r0, [r4, #0x1d]
	cmp r6, #3
	beq _080712DA
	movs r2, #8
	mov r8, r2
	b _080712DA
_08071236:
	ldrb r0, [r4, #7]
	b _080712C6
_0807123A:
	cmp r0, #1
	bne _08071246
_0807123E:
	ldrb r0, [r4, #0x19]
	strb r0, [r4, #9]
	movs r0, #7
	b _080712C6
_08071246:
	cmp r0, #2
	bne _0807128A
	ldrb r0, [r4, #9]
	subs r0, #1
	strb r0, [r4, #9]
	movs r1, #0xff
	ands r0, r1
	lsls r0, r0, #0x18
	ldrb r2, [r4, #0x19]
	lsls r1, r2, #0x18
	cmp r0, r1
	bgt _08071286
_0807125E:
	ldrb r0, [r4, #6]
	cmp r0, #0
	bne _0807126E
	movs r0, #0xfc
	ldrb r1, [r4]
	ands r0, r1
	strb r0, [r4]
	b _08071206
_0807126E:
	ldrb r0, [r4]
	subs r0, #1
	strb r0, [r4]
	movs r0, #1
	ldrb r2, [r4, #0x1d]
	orrs r0, r2
	strb r0, [r4, #0x1d]
	cmp r6, #3
	beq _0807123E
	movs r0, #8
	mov r8, r0
	b _0807123E
_08071286:
	ldrb r0, [r4, #5]
	b _080712C6
_0807128A:
	ldrb r0, [r4, #9]
	adds r0, #1
	strb r0, [r4, #9]
	movs r1, #0xff
	ands r0, r1
	ldrb r2, [r4, #0xa]
	cmp r0, r2
	blo _080712C4
_0807129A:
	ldrb r0, [r4]
	subs r0, #1
	movs r2, #0
	strb r0, [r4]
	ldrb r1, [r4, #5]
	strb r1, [r4, #0xb]
	movs r0, #0xff
	ands r0, r1
	cmp r0, #0
	beq _0807125E
	movs r0, #1
	ldrb r1, [r4, #0x1d]
	orrs r0, r1
	strb r0, [r4, #0x1d]
	ldrb r0, [r4, #0xa]
	strb r0, [r4, #9]
	cmp r6, #3
	beq _080712C8
	ldrb r2, [r4, #5]
	mov r8, r2
	b _080712C8
_080712C4:
	ldrb r0, [r4, #4]
_080712C6:
	strb r0, [r4, #0xb]
_080712C8:
	ldrb r0, [r4, #0xb]
	subs r0, #1
	strb r0, [r4, #0xb]
	ldr r0, [sp]
	cmp r0, #0
	bne _080712DA
	subs r0, #1
	str r0, [sp]
	b _080711D4
_080712DA:
	movs r0, #2
	ldrb r1, [r4, #0x1d]
	ands r0, r1
	cmp r0, #0
	beq _08071352
	cmp r6, #3
	bgt _0807131A
	movs r0, #8
	ldrb r2, [r4, #1]
	ands r0, r2
	cmp r0, #0
	beq _0807131A
	ldr r0, _08071304 @ =0x04000089
	ldrb r0, [r0]
	cmp r0, #0x3f
	bgt _0807130C
	ldr r0, [r4, #0x20]
	adds r0, #2
	ldr r1, _08071308 @ =0x000007FC
	b _08071316
	.align 2, 0
_08071304: .4byte 0x04000089
_08071308: .4byte 0x000007FC
_0807130C:
	cmp r0, #0x7f
	bgt _0807131A
	ldr r0, [r4, #0x20]
	adds r0, #1
	ldr r1, _08071328 @ =0x000007FE
_08071316:
	ands r0, r1
	str r0, [r4, #0x20]
_0807131A:
	cmp r6, #4
	beq _0807132C
	ldr r0, [r4, #0x20]
	ldr r1, [sp, #0x10]
	strb r0, [r1]
	b _0807133A
	.align 2, 0
_08071328: .4byte 0x000007FE
_0807132C:
	ldr r2, [sp, #0x10]
	ldrb r0, [r2]
	movs r1, #8
	ands r1, r0
	ldr r0, [r4, #0x20]
	orrs r0, r1
	strb r0, [r2]
_0807133A:
	movs r0, #0xc0
	ldrb r1, [r4, #0x1a]
	ands r0, r1
	adds r1, r4, #0
	adds r1, #0x21
	ldrb r1, [r1]
	adds r0, r1, r0
	strb r0, [r4, #0x1a]
	movs r2, #0xff
	ands r0, r2
	ldr r1, [sp, #0x14]
	strb r0, [r1]
_08071352:
	movs r0, #1
	ldrb r2, [r4, #0x1d]
	ands r0, r2
	cmp r0, #0
	beq _080713D8
	ldr r1, _0807139C @ =0x04000081
	ldrb r0, [r1]
	ldrb r2, [r4, #0x1c]
	bics r0, r2
	ldrb r2, [r4, #0x1b]
	orrs r0, r2
	strb r0, [r1]
	cmp r6, #3
	bne _080713A4
	ldr r0, _080713A0 @ =gUnknown_081B9FC8
	ldrb r1, [r4, #9]
	adds r0, r1, r0
	ldrb r0, [r0]
	ldr r2, [sp, #0xc]
	strb r0, [r2]
	movs r1, #0x80
	adds r0, r1, #0
	ldrb r2, [r4, #0x1a]
	ands r0, r2
	cmp r0, #0
	beq _080713D8
	ldr r0, [sp, #8]
	strb r1, [r0]
	ldrb r0, [r4, #0x1a]
	ldr r1, [sp, #0x14]
	strb r0, [r1]
	movs r0, #0x7f
	ldrb r2, [r4, #0x1a]
	ands r0, r2
	strb r0, [r4, #0x1a]
	b _080713D8
	.align 2, 0
_0807139C: .4byte 0x04000081
_080713A0: .4byte gUnknown_081B9FC8
_080713A4:
	movs r0, #0xf
	mov r1, r8
	ands r1, r0
	mov r8, r1
	ldrb r2, [r4, #9]
	lsls r0, r2, #4
	add r0, r8
	ldr r1, [sp, #0xc]
	strb r0, [r1]
	movs r2, #0x80
	ldrb r0, [r4, #0x1a]
	orrs r0, r2
	ldr r1, [sp, #0x14]
	strb r0, [r1]
	cmp r6, #1
	bne _080713D8
	ldr r0, [sp, #8]
	ldrb r1, [r0]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	bne _080713D8
	ldrb r0, [r4, #0x1a]
	orrs r0, r2
	ldr r1, [sp, #0x14]
	strb r0, [r1]
_080713D8:
	movs r0, #0
	strb r0, [r4, #0x1d]
_080713DC:
	mov r6, sl
	mov r4, sb
	cmp r6, #4
	bgt _080713E6
	b _08070FDC
_080713E6:
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

