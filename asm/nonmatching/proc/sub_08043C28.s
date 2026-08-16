	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08043C28
sub_08043C28: @ 0x08043C28
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r1, #0
	mov ip, r2
	mov r8, r3
	ldr r2, [sp, #0x1c]
	lsls r2, r2, #0x18
	ldr r0, _08043C88 @ =0xFFFFFE00
	adds r1, r0, #0
	adds r0, r6, #0
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldr r0, _08043C8C @ =0xFFFFFF00
	adds r1, r0, #0
	adds r0, r4, #0
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r0, _08043C90 @ =0x000001FF
	ands r6, r0
	subs r4, #0xa0
	movs r0, #0xff
	ands r4, r0
	cmp r2, #0
	beq _08043C68
	movs r0, #0x80
	lsls r0, r0, #5
	orrs r6, r0
_08043C68:
	orrs r7, r6
	orrs r5, r4
	ldr r3, _08043C94 @ =gUnknown_084A0756
	mov r0, ip
	str r0, [sp]
	mov r0, r8
	adds r1, r7, #0
	adds r2, r5, #0
	bl sub_0801BEFC
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08043C88: .4byte 0xFFFFFE00
_08043C8C: .4byte 0xFFFFFF00
_08043C90: .4byte 0x000001FF
_08043C94: .4byte gUnknown_084A0756

