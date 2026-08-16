	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802BD54
sub_0802BD54: @ 0x0802BD54
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r5, r2, #0
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	lsls r1, r1, #0x10
	ldr r0, _0802BDA8 @ =gUnknown_08090BCC
	mov sb, r0
	movs r7, #0xff
	lsls r7, r7, #0x10
	ands r7, r1
	ldr r4, _0802BDAC @ =0x000001FF
	mov r8, r4
_0802BD72:
	adds r4, r6, #0
	mov r0, r8
	ands r4, r0
	adds r0, r5, #0
	movs r1, #0xa
	bl __umodsi3
	adds r3, r0, #0
	adds r3, #0x10
	adds r0, r4, #0
	lsrs r1, r7, #0x10
	mov r4, sb
	ldr r2, [r4]
	bl sub_0801BD00
	adds r0, r5, #0
	movs r1, #0xa
	bl __udivsi3
	adds r5, r0, #0
	cmp r5, #0
	beq _0802BDB0
	subs r0, r6, #7
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	b _0802BD72
	.align 2, 0
_0802BDA8: .4byte gUnknown_08090BCC
_0802BDAC: .4byte 0x000001FF
_0802BDB0:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

