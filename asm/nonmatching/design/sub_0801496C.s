	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801496C
sub_0801496C: @ 0x0801496C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	ldr r6, _080149BC @ =gUnknown_0200BC14
	lsls r4, r3, #1
	mov r8, r4
	adds r5, r4, r6
	movs r4, #0
	strh r4, [r5]
	lsls r4, r3, #2
	movs r7, #0x80
	lsls r7, r7, #3
	adds r5, r6, r7
	adds r4, r4, r5
	str r0, [r4]
	movs r4, #0x81
	lsls r4, r4, #3
	adds r6, r6, r4
	add r8, r6
	mov r7, r8
	strh r1, [r7]
	movs r4, #1
	str r4, [sp]
	bl sub_0801489C
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080149BC: .4byte gUnknown_0200BC14

