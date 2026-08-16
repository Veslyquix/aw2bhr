	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0805F6D4
sub_0805F6D4: @ 0x0805F6D4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	movs r0, #1
	rsbs r0, r0, #0
	mov sb, r0
	movs r1, #0
	mov r8, r1
	bl sub_0805CA24
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0805F790
	ldr r3, _0805F7A0 @ =gUnknown_030013EC
	ldr r0, _0805F7A4 @ =gUnknown_030040D8
	ldr r2, [r0]
	ldrb r0, [r2, #2]
	ldrb r1, [r2, #3]
	ldrb r2, [r2]
	mov r4, r8
	str r4, [sp]
	ldr r4, [r3]
	movs r3, #0x78
	bl _call_via_r4
	movs r3, #0
	ldr r0, _0805F7A8 @ =gUnknown_08499590
	ldr r1, [r0]
	ldrh r2, [r1, #2]
	cmp r8, r2
	bge _0805F770
	mov ip, r0
	ldrh r1, [r1]
	str r1, [sp, #4]
	mov sl, r2
_0805F720:
	movs r1, #0
	adds r6, r3, #1
	str r6, [sp, #8]
	ldr r0, [sp, #4]
	cmp r1, r0
	bge _0805F76A
	lsls r0, r3, #2
	ldr r2, _0805F7AC @ =gUnknown_03003340
	adds r0, r0, r2
	ldr r5, [r0]
	ldr r7, _0805F7B0 @ =gUnknown_020288B4
	lsls r4, r3, #1
	mov r6, ip
	ldr r0, [r6]
	ldrh r2, [r0]
_0805F73E:
	adds r0, r5, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	blt _0805F764
	mov r6, ip
	ldr r0, [r6]
	ldr r6, _0805F7B4 @ =0x0000417A
	adds r0, r0, r6
	adds r0, r0, r4
	ldrh r0, [r0]
	adds r0, r0, r1
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0
	beq _0805F764
	mov sb, r1
	mov r8, r3
_0805F764:
	adds r1, #1
	cmp r1, r2
	blt _0805F73E
_0805F76A:
	ldr r3, [sp, #8]
	cmp r3, sl
	blt _0805F720
_0805F770:
	movs r0, #1
	rsbs r0, r0, #0
	cmp sb, r0
	beq _0805F790
	mov r1, sb
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	mov r2, r8
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	movs r2, #0
	str r2, [sp]
	movs r2, #2
	movs r3, #0
	bl sub_0805D648
_0805F790:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805F7A0: .4byte gUnknown_030013EC
_0805F7A4: .4byte gUnknown_030040D8
_0805F7A8: .4byte gUnknown_08499590
_0805F7AC: .4byte gUnknown_03003340
_0805F7B0: .4byte gUnknown_020288B4
_0805F7B4: .4byte 0x0000417A

