	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08033470
sub_08033470: @ 0x08033470
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r6, r0, #0
	movs r7, #0
	adds r4, r6, #0
	adds r4, #0x64
	movs r0, #0
	ldrsh r3, [r4, r0]
	ldr r5, _08033514 @ =gUnknown_08090D78
	cmp r3, #1
	bne _080334A0
	ldr r0, [r5]
	ldr r1, _08033518 @ =gUnknown_030032DC
	ldr r1, [r1]
	adds r1, #0xc0
	ldr r2, _0803351C @ =gUnknown_03003F28
	ldr r2, [r2]
	subs r2, #0xc0
	str r3, [sp]
	movs r3, #4
	bl sub_08063454
	movs r0, #2
	strh r0, [r4]
_080334A0:
	ldr r4, [r5]
	adds r0, r4, #0
	bl sub_08062FF4
	adds r0, r4, #0
	bl sub_08063518
	cmp r0, #0
	beq _0803350C
	ldr r0, _08033520 @ =0x04000208
	strh r7, [r0]
	ldr r1, _08033524 @ =0x04000202
	ldr r2, _08033528 @ =0x0000FFFF
	adds r0, r2, #0
	strh r0, [r1]
	str r7, [sp, #4]
	ldr r3, _0803352C @ =0x040000D4
	add r0, sp, #4
	str r0, [r3]
	movs r2, #0x80
	lsls r2, r2, #0x12
	str r2, [r3, #4]
	ldr r0, _08033530 @ =0x85010000
	str r0, [r3, #8]
	ldr r0, [r3, #8]
	ldr r0, _08033534 @ =gUnknown_08090D5C
	ldr r1, [r0, #8]
	str r1, [r3]
	str r2, [r3, #4]
	ldr r0, [r0, #0xc]
	subs r0, r0, r1
	cmp r0, #0
	bge _080334E4
	adds r0, #3
_080334E4:
	asrs r0, r0, #2
	movs r1, #0x84
	lsls r1, r1, #0x18
	orrs r0, r1
	str r0, [r3, #8]
	ldr r0, [r3, #8]
	ldr r0, _08033538 @ =gUnknown_03003F44
	ldr r0, [r0]
	ldr r4, _0803353C @ =gUnknown_0203C000
	adds r1, r4, #0
	bl sub_08011CAC
	ldr r1, _08033540 @ =0x485153CD
	ldr r0, _08033544 @ =gUnknown_0203BFFC
	str r1, [r0]
	bl _call_via_r4
	adds r0, r6, #0
	bl Proc_Break
_0803350C:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08033514: .4byte gUnknown_08090D78
_08033518: .4byte gUnknown_030032DC
_0803351C: .4byte gUnknown_03003F28
_08033520: .4byte 0x04000208
_08033524: .4byte 0x04000202
_08033528: .4byte 0x0000FFFF
_0803352C: .4byte 0x040000D4
_08033530: .4byte 0x85010000
_08033534: .4byte gUnknown_08090D5C
_08033538: .4byte gUnknown_03003F44
_0803353C: .4byte gUnknown_0203C000
_08033540: .4byte 0x485153CD
_08033544: .4byte gUnknown_0203BFFC

