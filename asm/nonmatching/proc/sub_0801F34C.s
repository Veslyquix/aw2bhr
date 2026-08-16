	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0801F34C
sub_0801F34C: @ 0x0801F34C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r6, r0, #0
	adds r7, r1, #0
	mov r8, r2
	adds r5, r3, #0
	bl sub_0801F3D4
	ldr r2, _0801F3B0 @ =gUnknown_0200F920
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r2, r1, r2
	movs r3, #0
	ldrb r0, [r2, #5]
	cmp r3, r0
	bge _0801F3C6
	ldr r0, _0801F3B4 @ =gUnknown_0848BAE4
	mov ip, r0
	ldr r1, _0801F3B8 @ =gUnknown_0848B780
	lsls r0, r6, #2
	adds r4, r0, r1
	adds r1, r2, #0
	adds r1, #8
_0801F380:
	ldrh r0, [r1, #2]
	cmp r0, r6
	bne _0801F3BC
	ldrh r1, [r1]
	adds r1, r5, r1
	ldrb r0, [r2, #4]
	subs r0, #0x10
	lsls r0, r0, #0xc
	adds r5, r1, r0
	ldrb r1, [r4, #1]
	lsls r0, r1, #4
	adds r0, r0, r1
	ldrb r4, [r4]
	adds r0, r0, r4
	lsls r0, r0, #2
	add r0, ip
	ldr r3, [r0]
	str r5, [sp]
	ldr r0, [sp, #0x1c]
	adds r1, r7, #0
	mov r2, r8
	bl PutSpriteExt
	b _0801F3C6
	.align 2, 0
_0801F3B0: .4byte gUnknown_0200F920
_0801F3B4: .4byte gUnknown_0848BAE4
_0801F3B8: .4byte gUnknown_0848B780
_0801F3BC:
	adds r1, #4
	adds r3, #1
	ldrb r0, [r2, #5]
	cmp r3, r0
	blt _0801F380
_0801F3C6:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

