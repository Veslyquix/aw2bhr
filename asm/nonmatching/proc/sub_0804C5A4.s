	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804C5A4
sub_0804C5A4: @ 0x0804C5A4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r3, _0804C6B0 @ =gUnknown_03001470
	ldr r0, _0804C6B4 @ =gUnknown_0813605C
	ldr r0, [r0]
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #5
	adds r1, r3, #0
	adds r1, #0x30
	adds r1, r2, r1
	ldrh r6, [r1]
	adds r3, #0x34
	adds r2, r2, r3
	ldrh r2, [r2]
	mov r8, r2
	bl sub_080156C4
	ldr r1, _0804C6B8 @ =gUnknown_08553C14
	ldr r0, _0804C6BC @ =gUnknown_0300450C
	ldrh r0, [r0]
	lsls r0, r0, #1
	adds r0, r6, r0
	adds r0, r0, r1
	ldrb r2, [r0]
	ldr r0, _0804C6C0 @ =gUnknown_03004508
	ldrh r3, [r0]
	ldr r1, _0804C6C4 @ =gUnknown_08553318
	ldr r0, _0804C6C8 @ =gUnknown_020296B0
	mov sb, r0
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r7, r0, #3
	mov r0, sb
	adds r4, r7, r0
	ldrh r0, [r4, #0x18]
	mov ip, r0
	lsls r5, r0, #1
	adds r1, r5, r1
	ldrh r0, [r1]
	adds r0, r0, r2
	cmp r3, r0
	bne _0804C670
	adds r0, r5, r7
	mov r1, sb
	adds r1, #0xc
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r0, #0xff
	beq _0804C66A
	adds r0, r6, #0
	mov r1, ip
	bl sub_080505A4
	ldr r2, _0804C6CC @ =gUnknown_02029A10
	mov r0, r8
	lsls r1, r0, #3
	add r1, r8
	lsls r1, r1, #2
	movs r0, #0xb4
	muls r0, r6, r0
	adds r1, r1, r0
	adds r1, r1, r2
	ldrh r0, [r1, #0x1e]
	adds r0, #1
	strh r0, [r1, #0x1e]
	ldrb r0, [r4, #0x1a]
	movs r1, #1
	ands r1, r0
	lsls r1, r1, #1
	ldr r2, _0804C6D0 @ =gUnknown_03004580
	lsls r3, r6, #4
	adds r0, r2, #4
	adds r0, r3, r0
	ldrh r0, [r0]
	subs r0, #1
	lsls r0, r0, #2
	adds r1, r1, r0
	adds r2, #2
	adds r3, r3, r2
	ldrh r2, [r3]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #3
	adds r1, r1, r0
	ldr r2, _0804C6D4 @ =gUnknown_085D6C94
	adds r1, r1, r2
	movs r2, #0
	ldrsh r0, [r1, r2]
	bl sub_0803B48C
	ldrb r0, [r4, #0x1a]
	adds r0, #1
	strb r0, [r4, #0x1a]
_0804C66A:
	ldrh r0, [r4, #0x18]
	adds r0, #1
	strh r0, [r4, #0x18]
_0804C670:
	ldr r0, _0804C6D8 @ =gUnknown_03001FBC
	movs r1, #0
	ldrsh r2, [r0, r1]
	adds r0, r6, #0
	mov r1, r8
	bl sub_0804CA98
	ldr r0, _0804C6D8 @ =gUnknown_03001FBC
	movs r1, #0
	ldrsh r2, [r0, r1]
	adds r0, r6, #0
	mov r1, r8
	bl sub_0804BECC
	ldr r0, _0804C6D8 @ =gUnknown_03001FBC
	movs r1, #0
	ldrsh r2, [r0, r1]
	adds r0, r6, #0
	mov r1, r8
	bl sub_0804DC5C
	adds r0, r6, #0
	mov r1, r8
	bl sub_08056E9C
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804C6B0: .4byte gUnknown_03001470
_0804C6B4: .4byte gUnknown_0813605C
_0804C6B8: .4byte gUnknown_08553C14
_0804C6BC: .4byte gUnknown_0300450C
_0804C6C0: .4byte gUnknown_03004508
_0804C6C4: .4byte gUnknown_08553318
_0804C6C8: .4byte gUnknown_020296B0
_0804C6CC: .4byte gUnknown_02029A10
_0804C6D0: .4byte gUnknown_03004580
_0804C6D4: .4byte gUnknown_085D6C94
_0804C6D8: .4byte gUnknown_03001FBC

