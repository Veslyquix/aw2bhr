	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0801F92C
sub_0801F92C: @ 0x0801F92C
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r3, #0
	ldr r0, _0801F97C @ =gUnknown_08090934
	ldr r2, [r0]
	ldr r1, [r2]
	mov ip, r0
	ldrh r1, [r1, #2]
	cmp r3, r1
	bge _0801F95C
	ldr r7, _0801F980 @ =gUnknown_03003340
	adds r6, r2, #0
	ldr r4, _0801F984 @ =0x0000417A
_0801F946:
	ldr r2, [r6]
	lsls r1, r3, #1
	adds r0, r2, r4
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r0, r5, r0
	stm r7!, {r0}
	adds r3, #1
	ldrh r2, [r2, #2]
	cmp r3, r2
	blt _0801F946
_0801F95C:
	ldr r3, _0801F988 @ =gUnknown_084999C8
	ldr r1, [r3]
	mov r0, ip
	ldr r2, [r0]
	ldr r0, [r2]
	ldrh r0, [r0]
	adds r1, #0x28
	strb r0, [r1]
	ldr r0, [r3]
	ldr r1, [r2]
	ldrh r1, [r1, #2]
	adds r0, #0x29
	strb r1, [r0]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801F97C: .4byte gUnknown_08090934
_0801F980: .4byte gUnknown_03003340
_0801F984: .4byte 0x0000417A
_0801F988: .4byte gUnknown_084999C8

