	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0807F57C
sub_0807F57C: @ 0x0807F57C
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	movs r6, #0
	movs r3, #0
	ldr r4, _0807F604 @ =gUnknown_03005944
	str r6, [r4]
	str r3, [sp, #4]
	bl sub_08078758
	ldr r1, _0807F608 @ =gUnknown_086166F0
	ldrb r0, [r1]
	ldr r3, [sp, #4]
	cmp r0, #0xff
	beq _0807F5FC
	adds r2, r4, #0
	adds r5, r1, #0
_0807F59C:
	movs r7, #0
	ldrb r0, [r5]
	cmp r0, #0xff
	beq _0807F5D2
	ldr r0, _0807F608 @ =gUnknown_086166F0
	adds r4, r6, r0
_0807F5A8:
	ldrb r0, [r4]
	str r2, [sp]
	str r3, [sp, #4]
	bl sub_0803CAB8
	ldr r2, [sp]
	ldr r3, [sp, #4]
	cmp r0, #0
	beq _0807F5C6
	adds r7, #1
	ldr r0, _0807F60C @ =gUnknown_030058E0
	adds r0, r3, r0
	ldrb r1, [r4]
	strb r1, [r0]
	adds r3, #1
_0807F5C6:
	adds r4, #1
	adds r5, #1
	adds r6, #1
	ldrb r0, [r4]
	cmp r0, #0xff
	bne _0807F5A8
_0807F5D2:
	adds r5, #1
	adds r6, #1
	cmp r7, #0
	beq _0807F5F2
	ldr r1, _0807F610 @ =gUnknown_03005958
	ldr r0, [r2]
	adds r0, r0, r1
	ldrb r1, [r5]
	strb r1, [r0]
	ldr r1, _0807F614 @ =gUnknown_03005948
	ldr r0, [r2]
	adds r0, r0, r1
	strb r7, [r0]
	ldr r0, [r2]
	adds r0, #1
	str r0, [r2]
_0807F5F2:
	adds r5, #1
	adds r6, #1
	ldrb r0, [r5]
	cmp r0, #0xff
	bne _0807F59C
_0807F5FC:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807F604: .4byte gUnknown_03005944
_0807F608: .4byte gUnknown_086166F0
_0807F60C: .4byte gUnknown_030058E0
_0807F610: .4byte gUnknown_03005958
_0807F614: .4byte gUnknown_03005948

