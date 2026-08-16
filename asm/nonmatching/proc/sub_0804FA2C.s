	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804FA2C
sub_0804FA2C: @ 0x0804FA2C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r1, _0804FC6C @ =gUnknown_03001FBC
	movs r2, #0
	ldrsh r0, [r1, r2]
	mov r4, sp
	mov r1, sp
	bl sub_0801566C
	ldr r2, _0804FC70 @ =gUnknown_03001470
	ldr r3, _0804FC6C @ =gUnknown_03001FBC
	movs r0, #0
	ldrsh r1, [r3, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	adds r1, r2, #0
	adds r1, #0x30
	adds r0, r0, r1
	ldr r6, _0804FC74 @ =gUnknown_0300453C
	ldrh r1, [r6]
	str r1, [r0]
	movs r0, #0
	ldrsh r1, [r3, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	adds r2, #0x34
	adds r0, r0, r2
	ldr r2, _0804FC78 @ =gUnknown_0300451C
	ldrh r1, [r2]
	str r1, [r0]
	ldrh r0, [r6]
	movs r1, #1
	eors r1, r0
	movs r0, #1
	ands r1, r0
	lsls r1, r1, #4
	ldrb r2, [r4, #3]
	movs r0, #0x11
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, #3]
	ldr r2, _0804FC7C @ =gUnknown_08551D0C
	ldrh r1, [r6]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r1, [r0]
	lsls r1, r1, #4
	ldrb r2, [r4, #5]
	movs r0, #0xf
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, #5]
	ldrh r0, [r6]
	lsls r2, r0, #8
	ldr r5, _0804FC80 @ =gUnknown_085D6A48
	ldr r3, _0804FC84 @ =gUnknown_03004580
	mov r8, r3
	lsls r0, r0, #4
	ldr r1, _0804FC88 @ =gUnknown_03004582
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r5
	ldrh r1, [r0, #0x12]
	ldr r3, _0804FC78 @ =gUnknown_0300451C
	ldrh r0, [r3]
	muls r0, r1, r0
	adds r2, r2, r0
	ldr r1, _0804FC8C @ =0x000003FF
	adds r0, r1, #0
	ands r2, r0
	ldrh r1, [r4, #4]
	ldr r0, _0804FC90 @ =0xFFFFFC00
	ands r0, r1
	orrs r0, r2
	strh r0, [r4, #4]
	ldr r2, _0804FC94 @ =gUnknown_0855239C
	ldrh r0, [r6]
	ldr r1, _0804FC98 @ =gUnknown_0300450C
	lsls r0, r0, #1
	ldrh r1, [r1]
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r1, [r0]
	movs r0, #3
	ands r1, r0
	lsls r1, r1, #2
	ldrb r2, [r4, #5]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, #5]
	ldr r2, _0804FC6C @ =gUnknown_03001FBC
	movs r3, #0
	ldrsh r0, [r2, r3]
	ldr r1, [sp]
	ldr r2, [sp, #4]
	bl sub_08015608
	ldrh r2, [r6]
	lsls r2, r2, #4
	ldr r1, _0804FC88 @ =gUnknown_03004582
	adds r0, r2, r1
	ldrh r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r5
	ldrh r0, [r0]
	mov r1, r8
	adds r1, #6
	adds r2, r2, r1
	ldrh r1, [r2]
	bl sub_08057D44
	ldr r2, _0804FC9C @ =gUnknown_02029A10
	mov sl, r2
	ldr r3, _0804FC78 @ =gUnknown_0300451C
	ldrh r5, [r3]
	lsls r3, r5, #3
	adds r3, r3, r5
	lsls r3, r3, #2
	ldrh r4, [r6]
	movs r7, #0xb4
	adds r1, r4, #0
	muls r1, r7, r1
	adds r3, r3, r1
	add r3, sl
	lsls r1, r4, #4
	movs r2, #0xa
	add r2, r8
	mov sb, r2
	add r1, sb
	ldrh r1, [r1]
	lsls r2, r1, #2
	adds r2, r2, r1
	lsls r2, r2, #3
	adds r2, r2, r0
	lsls r1, r4, #2
	adds r1, r1, r4
	adds r1, r1, r5
	lsls r1, r1, #2
	adds r2, r2, r1
	ldrh r1, [r2]
	strh r1, [r3, #4]
	ldr r3, _0804FC78 @ =gUnknown_0300451C
	ldrh r5, [r3]
	lsls r3, r5, #3
	adds r3, r3, r5
	lsls r3, r3, #2
	ldrh r4, [r6]
	adds r1, r4, #0
	muls r1, r7, r1
	adds r3, r3, r1
	add r3, sl
	lsls r1, r4, #4
	add r1, sb
	ldrh r1, [r1]
	lsls r2, r1, #2
	adds r2, r2, r1
	lsls r2, r2, #3
	adds r2, r2, r0
	lsls r1, r4, #2
	adds r1, r1, r4
	adds r1, r1, r5
	lsls r1, r1, #2
	adds r2, r2, r1
	ldrh r1, [r2]
	strh r1, [r3, #8]
	ldr r1, _0804FC78 @ =gUnknown_0300451C
	ldrh r5, [r1]
	lsls r3, r5, #3
	adds r3, r3, r5
	lsls r3, r3, #2
	ldrh r4, [r6]
	adds r1, r4, #0
	muls r1, r7, r1
	adds r3, r3, r1
	add r3, sl
	lsls r1, r4, #4
	add r1, sb
	ldrh r1, [r1]
	lsls r2, r1, #2
	adds r2, r2, r1
	lsls r2, r2, #3
	adds r2, r2, r0
	lsls r1, r4, #2
	adds r1, r1, r4
	adds r1, r1, r5
	lsls r1, r1, #2
	adds r2, r2, r1
	ldrh r1, [r2, #2]
	strh r1, [r3, #6]
	ldr r2, _0804FC78 @ =gUnknown_0300451C
	ldrh r5, [r2]
	lsls r2, r5, #3
	adds r2, r2, r5
	lsls r2, r2, #2
	ldrh r4, [r6]
	adds r1, r4, #0
	muls r1, r7, r1
	adds r2, r2, r1
	add r2, sl
	lsls r1, r4, #4
	add r1, sb
	ldrh r3, [r1]
	lsls r1, r3, #2
	adds r1, r1, r3
	lsls r1, r1, #3
	adds r1, r1, r0
	lsls r0, r4, #2
	adds r0, r0, r4
	adds r0, r0, r5
	lsls r0, r0, #2
	adds r1, r1, r0
	ldrh r0, [r1, #2]
	strh r0, [r2, #0xa]
	ldrh r0, [r6]
	ldr r3, _0804FC78 @ =gUnknown_0300451C
	ldrh r1, [r3]
	movs r2, #0
	movs r3, #0
	bl sub_0804BCB8
	ldr r1, _0804FC6C @ =gUnknown_03001FBC
	movs r2, #0
	ldrsh r0, [r1, r2]
	ldr r3, _0804FC78 @ =gUnknown_0300451C
	ldrh r1, [r3]
	lsls r2, r1, #3
	adds r2, r2, r1
	lsls r2, r2, #2
	ldrh r1, [r6]
	muls r1, r7, r1
	adds r2, r2, r1
	add r2, sl
	movs r3, #8
	ldrsh r1, [r2, r3]
	movs r3, #0xa
	ldrsh r2, [r2, r3]
	bl sub_080155C0
	ldr r1, _0804FC6C @ =gUnknown_03001FBC
	movs r2, #0
	ldrsh r0, [r1, r2]
	ldr r4, _0804FCA0 @ =gUnknown_08552FB8
	ldrh r1, [r6]
	lsls r1, r1, #4
	movs r3, #4
	add r8, r3
	add r8, r1
	mov r3, r8
	ldrh r2, [r3]
	lsls r3, r2, #1
	adds r3, r3, r2
	ldr r2, _0804FC88 @ =gUnknown_03004582
	adds r1, r1, r2
	ldrh r2, [r1]
	lsls r1, r2, #3
	adds r1, r1, r2
	adds r1, r1, r3
	lsls r1, r1, #2
	adds r4, #8
	adds r1, r1, r4
	ldr r1, [r1]
	bl sub_08015928
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804FC6C: .4byte gUnknown_03001FBC
_0804FC70: .4byte gUnknown_03001470
_0804FC74: .4byte gUnknown_0300453C
_0804FC78: .4byte gUnknown_0300451C
_0804FC7C: .4byte gUnknown_08551D0C
_0804FC80: .4byte gUnknown_085D6A48
_0804FC84: .4byte gUnknown_03004580
_0804FC88: .4byte gUnknown_03004582
_0804FC8C: .4byte 0x000003FF
_0804FC90: .4byte 0xFFFFFC00
_0804FC94: .4byte gUnknown_0855239C
_0804FC98: .4byte gUnknown_0300450C
_0804FC9C: .4byte gUnknown_02029A10
_0804FCA0: .4byte gUnknown_08552FB8

