	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080136DC
sub_080136DC: @ 0x080136DC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	lsls r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r4, r3, #0x18
	str r4, [sp]
	asrs r5, r3, #0x1f
	movs r3, #0x20
	ands r5, r3
	adds r4, r0, #0
	lsrs r1, r1, #0x10
	adds r0, r1, r2
	cmp r1, r0
	bge _08013768
	mov sl, r0
	ldr r7, _08013778 @ =gUnknown_0200B614
	movs r0, #0x1f
	mov ip, r0
_0801370C:
	ldr r2, _0801377C @ =gUnknown_0200B5F4
	adds r0, r1, r2
	mov r3, sp
	ldrb r3, [r3]
	strb r3, [r0]
	movs r6, #0
	lsls r0, r1, #4
	mov r8, r0
	adds r1, #1
	mov sb, r1
_08013720:
	mov r1, r8
	adds r0, r1, r6
	lsls r2, r0, #1
	adds r2, r2, r0
	adds r3, r2, r7
	ldrb r1, [r4]
	mov r0, ip
	ands r0, r1
	adds r0, r5, r0
	strb r0, [r3]
	adds r1, r2, #1
	adds r1, r1, r7
	ldrh r0, [r4]
	lsrs r0, r0, #5
	mov r3, ip
	ands r0, r3
	adds r0, r5, r0
	strb r0, [r1]
	adds r2, #2
	adds r2, r2, r7
	ldrh r0, [r4]
	lsrs r0, r0, #0xa
	ands r0, r3
	adds r0, r5, r0
	strb r0, [r2]
	adds r4, #2
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r6, #0xf
	bls _08013720
	mov r1, sb
	lsls r0, r1, #0x10
	lsrs r1, r0, #0x10
	cmp r1, sl
	blt _0801370C
_08013768:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08013778: .4byte gUnknown_0200B614
_0801377C: .4byte gUnknown_0200B5F4

