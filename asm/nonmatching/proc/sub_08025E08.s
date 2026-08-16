	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08025E08
sub_08025E08: @ 0x08025E08
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	mov r8, r1
	adds r4, r2, #0
	ldr r5, _08025E60 @ =gUnknown_030033EC
	ldrh r0, [r5]
	adds r1, r4, #0
	bl sub_08042C9C
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #1
	adds r6, r1, #0
	ldrh r1, [r5]
	ldr r0, _08025E64 @ =gUnknown_08499598
	ldr r2, [r0]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	cmp r0, r6
	blo _08025E68
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	mov r2, r8
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	lsls r2, r4, #0x10
	asrs r2, r2, #0x10
	bl sub_08025C98
	adds r4, r0, #0
	cmp r4, #0
	beq _08025E68
	ldrh r0, [r5]
	adds r1, r6, #0
	bl sub_08025B28
	adds r0, r4, #0
	b _08025E6A
	.align 2, 0
_08025E60: .4byte gUnknown_030033EC
_08025E64: .4byte gUnknown_08499598
_08025E68:
	movs r0, #0
_08025E6A:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

