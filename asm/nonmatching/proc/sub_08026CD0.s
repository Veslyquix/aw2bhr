	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08026CD0
sub_08026CD0: @ 0x08026CD0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _08026D38 @ =gUnknown_085C77A0
	mov r8, r0
	ldr r1, _08026D3C @ =gUnknown_03003FC0
	mov ip, r1
	movs r7, #0x5c
	ldr r6, _08026D40 @ =gUnknown_08499598
	movs r4, #0
	movs r3, #4
	rsbs r3, r3, #0
	movs r5, #4
_08026CEA:
	mov r1, ip
	ldrb r0, [r1, #2]
	muls r0, r7, r0
	adds r0, r3, r0
	add r0, r8
	adds r0, #0x48
	ldrb r2, [r0]
	adds r0, r2, #0
	cmp r0, #0xff
	beq _08026D24
	ldr r1, [r6]
	adds r1, r4, r1
	adds r1, #0x2d
	ldrb r0, [r1]
	orrs r0, r2
	strb r0, [r1]
	ldr r2, [r6]
	adds r2, r4, r2
	adds r2, #0x2e
	mov r1, ip
	ldrb r0, [r1, #2]
	muls r0, r7, r0
	adds r0, r3, r0
	add r0, r8
	adds r0, #0x49
	ldrb r1, [r2]
	ldrb r0, [r0]
	orrs r1, r0
	strb r1, [r2]
_08026D24:
	adds r4, #0x3c
	adds r3, #4
	subs r5, #1
	cmp r5, #0
	bge _08026CEA
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08026D38: .4byte gUnknown_085C77A0
_08026D3C: .4byte gUnknown_03003FC0
_08026D40: .4byte gUnknown_08499598

