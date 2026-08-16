	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08002964
sub_08002964: @ 0x08002964
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	adds r7, r1, #0
	mov r8, r2
	adds r5, r3, #0
	adds r0, r5, #0
	bl GetDesignRoomOption
	cmp r6, #0
	beq _08002988
	lsls r0, r6, #3
	ldr r1, _08002984 @ =0x000002B2
	adds r4, r0, r1
	b _0800298A
	.align 2, 0
_08002984: .4byte 0x000002B2
_08002988:
	ldr r4, _080029E4 @ =0x00000262
_0800298A:
	ldr r0, [sp, #0x1c]
	cmp r0, #0
	beq _080029A6
	movs r0, #0x1f
	ands r0, r5
	bl sub_0802A85C
	lsls r1, r4, #5
	ldr r2, _080029E8 @ =0x06010000
	adds r1, r1, r2
	movs r2, #0x80
	lsls r2, r2, #1
	bl sub_08011E54
_080029A6:
	subs r5, r7, #4
	ldr r0, _080029EC @ =0x000001FF
	ands r5, r0
	movs r4, #0xff
	mov r0, r8
	ands r4, r0
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r4, r0
	ldr r0, [sp, #0x18]
	cmp r0, #0
	beq _080029C4
	movs r0, #0x80
	lsls r0, r0, #1
	orrs r4, r0
_080029C4:
	ldr r1, _080029F0 @ =gUnknown_08485CF4
	lsls r0, r6, #2
	adds r0, r0, r1
	ldr r2, [r0]
	movs r3, #0x80
	lsls r3, r3, #5
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_0801BD00
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080029E4: .4byte 0x00000262
_080029E8: .4byte 0x06010000
_080029EC: .4byte 0x000001FF
_080029F0: .4byte gUnknown_08485CF4

