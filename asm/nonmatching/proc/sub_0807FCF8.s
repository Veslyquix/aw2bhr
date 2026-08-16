	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0807FCF8
sub_0807FCF8: @ 0x0807FCF8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r5, r0, #0
	movs r2, #0xf0
	rsbs r2, r2, #0
	adds r0, #0x4c
	movs r1, #0
	ldrsh r3, [r0, r1]
	ldr r0, [r5, #0x58]
	lsls r0, r0, #2
	adds r0, #8
	str r0, [sp]
	movs r0, #1
	movs r1, #0
	bl Interpolate
	str r0, [r5, #0x2c]
	adds r0, #0xa8
	ldr r1, _0807FD70 @ =0x000001FF
	ands r0, r1
	ldr r2, _0807FD74 @ =0x000041CA
	movs r1, #1
	str r1, [sp]
	movs r1, #0xa0
	movs r3, #0
	bl sub_08043C28
	movs r6, #0
	ldr r0, [r5, #0x58]
	cmp r6, r0
	bge _0807FE3A
	ldr r2, _0807FD78 @ =0x0000030A
	mov sl, r2
_0807FD42:
	adds r0, r5, #0
	adds r0, #0x4c
	movs r2, #0
	ldrsh r1, [r0, r2]
	lsls r3, r6, #2
	cmp r1, r3
	bge _0807FD84
	ldr r0, _0807FD7C @ =gUnknown_030059A0
	adds r0, r6, r0
	ldrb r1, [r0]
	adds r1, #8
	movs r0, #0xc0
	lsls r0, r0, #6
	mov r2, sl
	orrs r0, r2
	str r0, [sp]
	movs r0, #0
	movs r2, #0x40
	ldr r3, _0807FD80 @ =gUnknown_0848B6E6
	bl PutSprite
	b _0807FE2E
	.align 2, 0
_0807FD70: .4byte 0x000001FF
_0807FD74: .4byte 0x000041CA
_0807FD78: .4byte 0x0000030A
_0807FD7C: .4byte gUnknown_030059A0
_0807FD80: .4byte gUnknown_0848B6E6
_0807FD84:
	adds r0, r3, #0
	adds r0, #8
	cmp r1, r0
	bge _0807FE2E
	subs r3, r1, r3
	movs r0, #8
	str r0, [sp]
	movs r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x80
	lsls r2, r2, #2
	bl Interpolate
	str r0, [r5, #0x2c]
	ldr r4, _0807FE54 @ =gSinLut
	adds r1, r4, #0
	adds r1, #0x80
	movs r2, #0
	ldrsh r1, [r1, r2]
	lsls r1, r1, #4
	mov r8, r1
	adds r1, r0, #0
	cmp r1, #0
	bne _0807FDB8
	movs r1, #2
_0807FDB8:
	mov r0, r8
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov sb, r0
	movs r0, #0
	ldrsh r4, [r4, r0]
	rsbs r0, r4, #0
	lsls r0, r0, #4
	ldr r1, [r5, #0x2c]
	cmp r1, #0
	bne _0807FDD4
	movs r1, #2
_0807FDD4:
	bl Div
	lsls r0, r0, #0x10
	asrs r7, r0, #0x10
	lsls r0, r4, #4
	ldr r1, [r5, #0x2c]
	cmp r1, #0
	bne _0807FDE6
	movs r1, #2
_0807FDE6:
	bl Div
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	ldr r1, [r5, #0x2c]
	cmp r1, #0
	bne _0807FDF6
	movs r1, #2
_0807FDF6:
	mov r0, r8
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	adds r0, r6, #0
	mov r1, sb
	adds r2, r7, #0
	adds r3, r4, #0
	bl SetObjAffine
	lsls r1, r6, #9
	ldr r0, _0807FE58 @ =gUnknown_030059A0
	adds r0, r6, r0
	ldrb r0, [r0]
	orrs r1, r0
	movs r0, #0xc0
	lsls r0, r0, #6
	mov r2, sl
	orrs r0, r2
	str r0, [sp]
	movs r0, #0
	movs r2, #0xcc
	lsls r2, r2, #2
	ldr r3, _0807FE5C @ =gUnknown_0848B6E6
	bl PutSpriteExt
_0807FE2E:
	movs r0, #8
	add sl, r0
	adds r6, #1
	ldr r0, [r5, #0x58]
	cmp r6, r0
	blt _0807FD42
_0807FE3A:
	adds r2, r5, #0
	adds r2, #0x4c
	movs r0, #0
	ldrsh r1, [r2, r0]
	ldr r0, [r5, #0x58]
	lsls r0, r0, #2
	adds r0, #8
	cmp r1, r0
	bge _0807FE60
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
	b _0807FE78
	.align 2, 0
_0807FE54: .4byte gSinLut
_0807FE58: .4byte gUnknown_030059A0
_0807FE5C: .4byte gUnknown_0848B6E6
_0807FE60:
	movs r0, #0
	strh r0, [r2]
	ldr r0, _0807FE88 @ =gUnknown_08616814
	movs r1, #3
	bl Proc_Start
	ldr r0, _0807FE8C @ =gUnknown_086167EC
	bl Proc_BreakEach
	adds r0, r5, #0
	bl Proc_Break
_0807FE78:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807FE88: .4byte gUnknown_08616814
_0807FE8C: .4byte gUnknown_086167EC

