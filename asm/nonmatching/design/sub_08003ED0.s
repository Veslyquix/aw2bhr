	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08003ED0
sub_08003ED0: @ 0x08003ED0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	movs r7, #0
	ldr r1, _08003F38 @ =gUnknown_08499590
	ldr r0, [r1]
	ldrh r0, [r0, #2]
	cmp r7, r0
	bge _08003F2C
	adds r3, r1, #0
_08003EE6:
	movs r4, #0
	ldr r0, [r3]
	adds r1, r7, #1
	mov r8, r1
	ldrh r0, [r0]
	cmp r4, r0
	bge _08003F22
	ldr r5, _08003F38 @ =gUnknown_08499590
	lsls r6, r7, #1
_08003EF8:
	ldr r1, [r5]
	ldr r2, _08003F3C @ =0x0000417A
	adds r0, r1, r2
	adds r0, r0, r6
	ldrh r0, [r0]
	adds r0, r0, r4
	ldr r2, _08003F40 @ =0x00001432
	adds r1, r1, r2
	adds r1, r1, r0
	ldrb r2, [r1]
	adds r0, r4, #0
	adds r1, r7, #0
	str r3, [sp]
	bl sub_08003DC4
	adds r4, #1
	ldr r0, [r5]
	ldr r3, [sp]
	ldrh r0, [r0]
	cmp r4, r0
	blt _08003EF8
_08003F22:
	mov r7, r8
	ldr r0, [r3]
	ldrh r0, [r0, #2]
	cmp r7, r0
	blt _08003EE6
_08003F2C:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08003F38: .4byte gUnknown_08499590
_08003F3C: .4byte 0x0000417A
_08003F40: .4byte 0x00001432

