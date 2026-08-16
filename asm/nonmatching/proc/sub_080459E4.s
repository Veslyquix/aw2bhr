	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080459E4
sub_080459E4: @ 0x080459E4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	movs r6, #0
	ldr r2, _08045A5C @ =gUnknown_084995FE
	ldr r1, _08045A60 @ =gUnknown_0812A0F4
	ldr r0, [r1]
	ldrh r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r4, r0, #1
	adds r0, #0x33
	mov sb, r1
	cmp r4, r0
	bge _08045A52
	ldr r0, _08045A64 @ =gUnknown_08499594
	mov r8, r0
	adds r7, r2, #0
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r5, r0, #2
_08045A12:
	mov r1, r8
	ldr r0, [r1]
	adds r1, r0, r5
	ldrb r0, [r1]
	cmp r0, #0
	beq _08045A3C
	ldrb r1, [r1, #4]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #0
	beq _08045A3A
	lsls r0, r1, #0x19
	lsrs r0, r0, #0x19
	subs r0, #1
	movs r1, #0xa
	bl Div
	adds r0, #1
	cmp r0, #9
	bgt _08045A3C
_08045A3A:
	adds r6, #1
_08045A3C:
	adds r5, #0xc
	adds r4, #1
	mov r1, sb
	ldr r0, [r1]
	ldrh r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r7
	ldrh r0, [r0]
	adds r0, #0x33
	cmp r4, r0
	blt _08045A12
_08045A52:
	cmp r6, #0
	bgt _08045A68
	movs r0, #0
	b _08045A6A
	.align 2, 0
_08045A5C: .4byte gUnknown_084995FE
_08045A60: .4byte gUnknown_0812A0F4
_08045A64: .4byte gUnknown_08499594
_08045A68:
	movs r0, #1
_08045A6A:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

