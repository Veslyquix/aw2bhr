	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08087040
sub_08087040: @ 0x08087040
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r0, _080870B0 @ =gUnknown_081D9440
	mov sl, r0
	ldr r1, _080870B4 @ =gUnknown_081D9444
	mov sb, r1
	movs r7, #0x80
	lsls r7, r7, #6
	mov r8, r7
	movs r0, #0x54
	str r0, [sp, #4]
	movs r6, #0x50
	movs r4, #0x97
	movs r5, #3
_08087064:
	adds r0, r6, #0
	mov r1, r8
	orrs r0, r1
	str r0, [sp]
	movs r0, #1
	adds r1, r4, #0
	movs r2, #0
	mov r7, sl
	ldr r3, [r7]
	bl sub_0801BEBC
	ldr r0, [sp, #4]
	mov r1, r8
	orrs r0, r1
	str r0, [sp]
	movs r0, #1
	adds r1, r4, #0
	movs r2, #0x10
	mov r7, sb
	ldr r3, [r7]
	bl sub_0801BEBC
	ldr r0, [sp, #4]
	adds r0, #8
	str r0, [sp, #4]
	adds r6, #8
	adds r4, #0x18
	subs r5, #1
	cmp r5, #0
	bge _08087064
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080870B0: .4byte gUnknown_081D9440
_080870B4: .4byte gUnknown_081D9444

