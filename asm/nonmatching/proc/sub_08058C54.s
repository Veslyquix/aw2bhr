	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08058C54
sub_08058C54: @ 0x08058C54
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #8
	mov r8, r0
	adds r4, r1, #0
	adds r6, r2, #0
	movs r0, #0
	str r0, [sp, #4]
	ldr r2, _08058CC8 @ =gUnknown_085D5ABC
	ldr r0, _08058CCC @ =gUnknown_030040D8
	ldr r0, [r0]
	ldrb r1, [r0]
	movs r0, #0x5c
	muls r0, r1, r0
	adds r0, r0, r2
	ldrb r5, [r0, #0x1d]
	ldr r0, _08058CD0 @ =0x0000270F
	mov sb, r0
	mov r0, sb
	strh r0, [r6]
	mov r0, r8
	subs r0, #1
	str r6, [sp]
	adds r1, r4, #0
	adds r2, r5, #0
	add r3, sp, #4
	bl sub_08058CE8
	mov r0, r8
	adds r0, #1
	str r6, [sp]
	adds r1, r4, #0
	adds r2, r5, #0
	add r3, sp, #4
	bl sub_08058CE8
	subs r1, r4, #1
	str r6, [sp]
	mov r0, r8
	adds r2, r5, #0
	add r3, sp, #4
	bl sub_08058CE8
	adds r4, #1
	str r6, [sp]
	mov r0, r8
	adds r1, r4, #0
	adds r2, r5, #0
	add r3, sp, #4
	bl sub_08058CE8
	ldrh r0, [r6]
	cmp r0, sb
	beq _08058CD4
	ldr r0, [sp, #4]
	b _08058CD8
	.align 2, 0
_08058CC8: .4byte gUnknown_085D5ABC
_08058CCC: .4byte gUnknown_030040D8
_08058CD0: .4byte 0x0000270F
_08058CD4:
	movs r0, #1
	rsbs r0, r0, #0
_08058CD8:
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

