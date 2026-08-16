	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802BAFC
sub_0802BAFC: @ 0x0802BAFC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r5, r2, #0
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	ldr r0, _0802BB6C @ =0x000001FF
	mov sb, r0
	adds r4, r7, #0
	ands r4, r0
	movs r1, #0x80
	lsls r1, r1, #3
	adds r0, r1, #0
	orrs r6, r0
	ldr r0, _0802BB70 @ =gUnknown_0849A3B8
	mov r8, r0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	adds r0, r5, #0
	movs r1, #0xa
	bl __modsi3
	adds r3, r0, #0
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	adds r3, #0x10
	adds r0, r4, #0
	adds r1, r6, #0
	mov r2, r8
	bl sub_0801BD00
	adds r0, r5, #0
	movs r1, #0xa
	bl __divsi3
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	cmp r3, #0
	beq _0802BB60
	subs r0, r7, #7
	mov r1, sb
	ands r0, r1
	adds r3, #0x10
	adds r1, r6, #0
	mov r2, r8
	bl sub_0801BD00
_0802BB60:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802BB6C: .4byte 0x000001FF
_0802BB70: .4byte gUnknown_0849A3B8

