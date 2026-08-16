	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08034A7C
sub_08034A7C: @ 0x08034A7C
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #4
	mov r8, r0
	adds r6, r1, #0
	ldr r2, _08034AF0 @ =gUnknown_08610A38
	ldr r1, _08034AF4 @ =gUnknown_08499CCC
	lsls r0, r6, #2
	adds r0, r0, r1
	ldr r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r5, [r0]
	adds r0, r5, #0
	bl sub_08034A44
	adds r4, r0, #0
	mov r0, r8
	adds r1, r5, #0
	bl sub_08034A58
	adds r6, #0x3d
	adds r1, r4, #0
	subs r1, #0x10
	movs r0, #4
	rsbs r0, r0, #0
	add r8, r0
	movs r0, #0
	mov sb, r0
	str r0, [sp]
	adds r0, r6, #0
	mov r2, r8
	movs r3, #0
	bl sub_0801F34C
	adds r0, r5, #0
	bl sub_0808B6B0
	lsls r0, r0, #3
	adds r4, r4, r0
	mov r0, sb
	str r0, [sp]
	adds r0, r6, #0
	adds r1, r4, #0
	mov r2, r8
	movs r3, #0
	bl sub_0801F34C
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08034AF0: .4byte gUnknown_08610A38
_08034AF4: .4byte gUnknown_08499CCC

