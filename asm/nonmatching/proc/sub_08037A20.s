	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08037A20
sub_08037A20: @ 0x08037A20
	push {r4, r5, r6, r7, lr}
	mov ip, r0
	adds r6, r1, #0
	ldr r0, _08037A74 @ =gUnknown_03003F68
	ldr r2, [r0]
	ldrb r0, [r2]
	adds r3, r0, #1
	movs r1, #2
	rsbs r1, r1, #0
	ands r3, r1
	ldrb r0, [r2, #1]
	adds r0, #1
	ands r0, r1
	movs r4, #0
	movs r1, #0
	lsls r0, r0, #3
	cmp r1, r0
	bge _08037A6C
	asrs r5, r3, #1
	adds r7, r0, #0
_08037A48:
	adds r3, r1, #0
	adds r3, #0x10
	cmp r5, #0
	beq _08037A66
	lsls r0, r1, #2
	mov r2, ip
	adds r1, r0, r2
	adds r2, r5, #0
_08037A58:
	adds r0, r6, r4
	strh r0, [r1]
	adds r4, #1
	adds r1, #2
	subs r2, #1
	cmp r2, #0
	bne _08037A58
_08037A66:
	adds r1, r3, #0
	cmp r1, r7
	blt _08037A48
_08037A6C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08037A74: .4byte gUnknown_03003F68

