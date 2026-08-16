	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08043E3C
sub_08043E3C: @ 0x08043E3C
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	adds r6, r0, #0
	mov r8, r1
	mov sb, r2
	ldr r5, _08043E88 @ =gUnknown_084A0090
	movs r1, #0x18
	bl __divsi3
	adds r4, r0, #0
	lsls r4, r4, #2
	adds r0, r6, #0
	movs r1, #0x18
	bl __modsi3
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r4, r4, r1
	adds r5, #0xc
	adds r4, r4, r5
	ldr r0, [r4]
	mov r1, r8
	bl Decompress
	adds r0, r6, #0
	mov r1, sb
	bl sub_08043AA0
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08043E88: .4byte gUnknown_084A0090

