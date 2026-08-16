	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802A5C4
sub_0802A5C4: @ 0x0802A5C4
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldrb r1, [r4, #1]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0802A5F2
	ldr r2, _0802A684 @ =gUnknown_030030F8
	ldr r0, _0802A688 @ =gUnknown_08499594
	ldr r1, [r0]
	subs r1, r4, r1
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r1, r0, #4
	adds r0, r0, r1
	lsls r1, r0, #8
	adds r0, r0, r1
	lsls r1, r0, #0x10
	adds r0, r0, r1
	rsbs r0, r0, #0
	asrs r0, r0, #8
	adds r0, #1
	strb r0, [r2]
_0802A5F2:
	ldrb r1, [r4, #1]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0802A67E
	ldr r2, _0802A68C @ =gUnknown_08090B84
	ldr r0, [r2]
	ldr r5, [r0]
	subs r1, r4, r5
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r1, r0, #4
	adds r0, r0, r1
	lsls r1, r0, #8
	adds r0, r0, r1
	lsls r1, r0, #0x10
	adds r0, r0, r1
	rsbs r0, r0, #0
	asrs r0, r0, #2
	mov ip, r0
	movs r0, #0xc0
	mov r1, ip
	ands r1, r0
	mov ip, r1
	mov r0, ip
	adds r0, #1
	adds r3, r0, #0
	adds r0, #0x32
	adds r6, r2, #0
	cmp r3, r0
	bge _0802A65E
	adds r2, r5, #0
	movs r5, #0x80
_0802A634:
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #2
	adds r1, r2, r0
	ldrb r0, [r1]
	cmp r0, #0
	beq _0802A650
	cmp r1, r4
	beq _0802A650
	ldrb r1, [r1, #1]
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	bne _0802A67E
_0802A650:
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	mov r0, ip
	adds r0, #0x33
	cmp r3, r0
	blt _0802A634
_0802A65E:
	ldr r2, _0802A684 @ =gUnknown_030030F8
	ldr r0, [r6]
	ldr r1, [r0]
	subs r1, r4, r1
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r1, r0, #4
	adds r0, r0, r1
	lsls r1, r0, #8
	adds r0, r0, r1
	lsls r1, r0, #0x10
	adds r0, r0, r1
	rsbs r0, r0, #0
	asrs r0, r0, #8
	adds r0, #1
	strb r0, [r2]
_0802A67E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802A684: .4byte gUnknown_030030F8
_0802A688: .4byte gUnknown_08499594
_0802A68C: .4byte gUnknown_08090B84

